"
I edit text and provide high level abstractions of essential text editor functionality such as selection, cursor, text insertions and deletions.
I subclass infinite data source in order to be able to smoothly display practically infinite amounts of text.
"
Class {
	#name : #BrTextEditor,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'text',
		'cursor',
		'selection',
		'selectionRecorder',
		'segmentBuilder',
		'segmentCollector',
		'styler',
		'commandMutex',
		'stylerEventHandler',
		'interactions'
	],
	#classInstVars : [
		'isDebug'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #cleanup }
BrTextEditor class >> cleanUp [
	super cleanUp.
	
	isDebug := nil
]

{ #category : #accessing }
BrTextEditor class >> isDebug [
	^ isDebug ifNil: [ false ]
]

{ #category : #accessing }
BrTextEditor class >> isDebug: aBoolean [
	isDebug := aBoolean
]

{ #category : #asserting }
BrTextEditor >> assertIndex: aFromIndex to: aToIndex [
	self
		assert: [ aFromIndex >= 0 ]
		description: [ '"from" index must not be negative' ].
		
	self
		assert: [ aToIndex >= 0 ]
		description: [ '"to" index must not be negative' ].
		
	self
		assert: [ aFromIndex <= self text size ]
		description: [ '"from" index must be smaller or equal to text size' ].
		
	self
		assert: [ aToIndex <= self text size ]
		description: [ '"to" index must be smaller or equal to text size' ].
		
	self
		assert: [ aFromIndex <= aToIndex ]
		description: [ '"from" index must be smaller or equal to "to" index' ].
]

{ #category : #'private - selection' }
BrTextEditor >> commitSelection [
	self selectionRecorder commit: self
]

{ #category : #'text - copy/paste' }
BrTextEditor >> copy: aFromIndex to: aToIndex [
	"Copy text within given text interval to the clipboard"
	
	Clipboard clipboardText: (self text from: aFromIndex + 1 to: aToIndex) asString
]

{ #category : #'text - copy/paste' }
BrTextEditor >> copySelected [
	"Copy currently selected text to the clipboard"
	
	self selection isEmpty
		ifTrue: [ ^ self ].
		
	self
		copy: self selection from
		to: self selection to
]

{ #category : #accessing }
BrTextEditor >> cursor [
	^ cursor
]

{ #category : #'text - copy/paste' }
BrTextEditor >> cut: aFromIndex to: aToIndex [
	"Copy text within given text interval to the clipboard and remove it from the editor.
	Note: I update the cursor location and selection"

	self copy: aFromIndex to: aToIndex.

	self selectNone.
	self moveCursorTo: aFromIndex.
	self delete: aFromIndex to: aToIndex
]

{ #category : #'text - copy/paste' }
BrTextEditor >> cutSelected [
	"Copy currently selected text to the clipboard and remove it from the editor.
	Note: I update the cursor location and selection"
	
	self selection isEmpty
		ifTrue: [ ^ self ].
	
	self
		cut: self selection from
		to: self selection to
]

{ #category : #initialization }
BrTextEditor >> defaultCursor [
	^ BrTextEditorSingleCursor new
]

{ #category : #initialization }
BrTextEditor >> defaultSegmentBuilder [
	^ BrTextEditorAttributedLineSegmentBuilder new
]

{ #category : #initialization }
BrTextEditor >> defaultSegmentCollector [
	^ BrTextEditorSegmentCollector new
]

{ #category : #initialization }
BrTextEditor >> defaultSelection [
	<return: #BlSelection>

	^ BlCompositeSelection new
]

{ #category : #initialization }
BrTextEditor >> defaultSelectionRecorder [
	<return: #BrTextEditorSelectionRecorder>

	^ BrTextEditorSelectionOverwriteRecorder new
]

{ #category : #initialization }
BrTextEditor >> defaultStyler [
	^ BrTextNullStyler new
]

{ #category : #initialization }
BrTextEditor >> defaultStylerEventHandler [
	^ BlEventHandler on: BrTextStyledEvent do: [ :anEvent |		
		(anEvent text previousGeneration == self text generation)
			ifTrue: [
				self text rope: anEvent text text rope.
				self invalidateAll.
				self updateAll ]
			ifFalse: [
				Bloc debugModeEnabled
					ifTrue: [ Error signal: 'Wrong generation!' ].
				self styleText ] ]
]

{ #category : #initialization }
BrTextEditor >> defaultText [
	<return: #BlText>
	^ BlRopedText string: ''
]

{ #category : #'private - text' }
BrTextEditor >> delete: aFromTextIndex to: aToTextIndex [
	"I delete a piece of text within a given text interval without cursor or selection update.
	Note: cursor or selection location after deletion may be invalid!"

	self deleter
		from: aFromTextIndex to: aToTextIndex;
		withoutCursorUpdate;
		withoutSelectionUpdate;
		delete
]

{ #category : #'api - modification' }
BrTextEditor >> deleter [
	^ BrTextEditorDeleter new editor: self
]

{ #category : #'private - text' }
BrTextEditor >> deselect: aFromTextIndex to: aToTextIndex [
	"Deselect text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"

	self deselecter
		from: aFromTextIndex to: aToTextIndex;
		deselect
]

{ #category : #'api - modification' }
BrTextEditor >> deselecter [
	^ BrTextEditorDeselecter new editor: self
]

{ #category : #'commands - processing' }
BrTextEditor >> enqueueCommand: aBrTextEditorInsertCommand [
	commandMutex critical: [ aBrTextEditorInsertCommand executeOn: self ]
]

{ #category : #'text - selection' }
BrTextEditor >> hasSelection [
	"Return true of there is at least one selected character, false otherwise"
	<return: #Boolean>
	
	^ self selection isNotEmpty
]

{ #category : #'text - cursor' }
BrTextEditor >> hideCursor [
	| aCommand |

	self cursor isVisible: false.

	aCommand := self newCursorChangeCommand
		position: self cursor position.
	self enqueueCommand: aCommand
]

{ #category : #initialization }
BrTextEditor >> initialize [
	super initialize.
	
	cursor := self defaultCursor.
	selection := self defaultSelection.
	selectionRecorder := self defaultSelectionRecorder.
	
	text := self defaultText.
	self initializeText: text.
	
	segmentCollector := self defaultSegmentCollector.
	segmentCollector editor: self.
	segmentCollector text: text.
	segmentBuilder := self defaultSegmentBuilder.
	styler := self defaultStyler.
	stylerEventHandler := self defaultStylerEventHandler.
	commandMutex := Mutex new.
	interactions := OrderedCollection new.
	self initializeInteractions
]

{ #category : #interactions }
BrTextEditor >> initializeInteractions [

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key a; build);
		action: [ self selecter all select ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key x; build);
		action: [ self cutSelected ]).
		
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key c; build);
		action: [ self copySelected ]).
		
	"Paste a text from the clipboard at the current cursor position.
	I delete any currently selected text and update cursor position"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key v; build);
		action: [ self paster fromClipboard atCursor paste ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder escape; build);
		action: [ self selectNone ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowLeft; build);
		action: [ self selectToLeft ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift; key: Key arrowRight; build);
		action: [ self selectToRight ]).

	"left-arrow => move cursor left"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowLeft; build);
		action: [ self moveCursorLeft ]).

	"right-arrow => move cursor right"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder key: Key arrowRight; build);
		action: [ self moveCursorRight ]).
	
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowRight; build);
		action: [ self moveCursorToEndNextWord ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder meta; key: Key arrowLeft; build);
		action: [ self moveCursorToStartPreviousWord ]).
]

{ #category : #initialization }
BrTextEditor >> initializeText: aBrText [
	aBrText when: BlTextStringInserted send: #onStringInserted: to: self.
	aBrText when: BlTextDeleted send: #onTextDeleted: to: self
]

{ #category : #'private - text' }
BrTextEditor >> insertString: aString at: aTextIndex [

	self inserter
		at: aTextIndex;
		string: aString;
		withoutCursorUpdate;
		withoutSelectionUpdate;
		withoutSelectionDelete;
		insert
]

{ #category : #'api - modification' }
BrTextEditor >> inserter [
	^ BrTextEditorInserter new editor: self
]

{ #category : #interactions }
BrTextEditor >> interactions [
	^ interactions
]

{ #category : #'private - updating' }
BrTextEditor >> invalidate: aFromTextIndex to: aToTextIndex [
	"Invalidate segments (reset their internal cache) within text interval specified by from and to indices"
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newInvalidateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand
]

{ #category : #'private - updating' }
BrTextEditor >> invalidateAll [
	self segmentCollector segments do: #invalidate
]

{ #category : #accessing }
BrTextEditor >> itemCount [
	^ segmentCollector computedSegmentsCount
]

{ #category : #accessing }
BrTextEditor >> itemIdAt: aPosition [
	^ (segmentCollector segmentAt: aPosition) index
]

{ #category : #accessing }
BrTextEditor >> itemTypeAt: aPosition [
	"Return segment type at a given position"
	<return: #BrEditorSegmentType>
	
	^ (segmentCollector segmentAt: aPosition) segmentType
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorLeft [
	"Moves cursor to the left by one character without any other side effects.
	Note:
		- I don't change current selection.
		- I request segments update"

	self moveCursorTo: (self cursor position - 1 max: 0)
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorRight [
	"Moves cursor to the right by one character without any other side effects.
	Note:
		- I don't change current selection.
		- I request segments update"

	self moveCursorTo: (self cursor position + 1 min: self text size)
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorTo: aTextIndex [
	"Moves cursor to a given position without any further action such as cancelling selection"
	<event: #BrTextEditorCursorMovedEvent>
	| aCommand |

	self
		assert: [ aTextIndex between: 0 and: self text size ]
		description: [ 'Text cursor must not exceed text bounds' ].

	aCommand := self newCursorMoveCommand
		position: aTextIndex.
	self enqueueCommand: aCommand
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorToEndNextWord [
	| textIterator newPosition |
	"Moves cursor to the left by one character"

	textIterator := self text iterator: (self cursor position max: 1) to: self text size.
	newPosition := self cursor position.
	[ textIterator hasNext and: [ newPosition = self cursor position ] ] whileTrue: [
		| skip |
		skip := textIterator peek isSeparator.
		textIterator nextWord.
		skip ifFalse: [ newPosition := textIterator position - 1 ] ].

	self moveCursorTo: newPosition
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorToStartPreviousWord [
	| textIterator newPosition |
	"Moves cursor to the left by one character"

	"textIterator := self text iterator: 1 to: (self cursor position max: 1).
	newPosition := self cursor position.
	[ textIterator hasNext and: [ newPosition = self cursor position ] ] whileTrue: [
		| skip |
		skip := textIterator peek isSeparator.
		textIterator nextWord.
		skip ifFalse: [ newPosition := textIterator position - 1 ] ].

	self moveCursorTo: newPosition.
	self selectNone"
]

{ #category : #'commands - creation' }
BrTextEditor >> newCursorChangeCommand [
	^ BrTextEditorCursorChangeCommand new
]

{ #category : #'commands - creation' }
BrTextEditor >> newCursorMoveCommand [
	^ BrTextEditorCursorMoveCommand new
]

{ #category : #'commands - creation' }
BrTextEditor >> newInvalidateCommand [
	^ BrTextEditorInvalidateCommand new
]

{ #category : #'commands - creation' }
BrTextEditor >> newSelectCommand [
	^ BrTextEditorSelectCommand new
]

{ #category : #'commands - creation' }
BrTextEditor >> newSelectionUpdateCommand [
	^ BrTextEditorSelectionUpdateCommand new
]

{ #category : #'commands - creation' }
BrTextEditor >> newUpdateCommand [
	^ BrTextEditorUpdateCommand new
]

{ #category : #'event firing' }
BrTextEditor >> notifyCursorMoved: aFromIndex to: aToIndex [
	self fireEvent: (BrTextEditorCursorMovedEvent from: aFromIndex to: aToIndex)
]

{ #category : #'event firing' }
BrTextEditor >> notifyDeletedFrom: aFromIndex to: aToIndex [
	self fireEvent: (BrTextEditorDeletedEvent from: aFromIndex to: aToIndex)
]

{ #category : #'event firing' }
BrTextEditor >> notifyDeselelected [
	self fireEvent: (BrTextEditorDeselectedEvent new)
]

{ #category : #'event firing' }
BrTextEditor >> notifyInserted: aText at: aTextIndex [
	self fireEvent: (BrTextEditorInsertedEvent text: aText at: aTextIndex)
]

{ #category : #'event firing' }
BrTextEditor >> notifySelelectedFrom: aFromIndex to: aToIndex [
	self fireEvent: (BrTextEditorSelectedEvent new fromIndex: aFromIndex; toIndex: aToIndex)
]

{ #category : #hooks }
BrTextEditor >> onAttached: anEditorElement [
	super onAttached: anEditorElement.

	anEditorElement addEventHandler: BrTextEditorSelectionHandler new.
	anEditorElement addEventHandler: BrTextEditorInsertionHandler new.
	anEditorElement addEventHandler: BrTextEditorDeletionHandler new.

	self interactions do: [ :anInteraction | anEditorElement addShortcut: anInteraction ].

	anEditorElement when: BlMouseDownEvent do: [ :anEvent |
		anEvent currentTarget requestFocus.
		self selectNone ].
	anEditorElement when: BlFocusEvent do: [ self showCursor ].
	anEditorElement when: BlBlurEvent do: [ self hideCursor ].
	
	self notifyChanged
]

{ #category : #'instance creation' }
BrTextEditor >> onBindHolder: aSegmentHolder at: aPosition [
	"I bind a segment at a given position to provided segment holder"
	| aSegment |

	"First we want to acquire a segment for a given position"
	aSegment := segmentCollector segmentAt: aPosition.
	"and than bind it to the holder"
	aSegmentHolder segment: aSegment
]

{ #category : #'instance creation' }
BrTextEditor >> onBindHolder: aSegmentHolder at: aPosition payloads: aCollectionOfPayloads [	
	"I bind a segment at a given position to provided segment holder"

	aCollectionOfPayloads
		ifEmpty: [ self onBindHolder: aSegmentHolder at: aPosition ]
		ifNotEmpty: [ :theCommands |
			theCommands do: [ :aHolderCommand | aHolderCommand executeOn: aSegmentHolder ] ]
]

{ #category : #'instance creation' }
BrTextEditor >> onCreateHolder: anEditorElement type: aSegmentType [
	"Create and return a new segment holder of a given type to be used with provided editor element"
	<return: #BrEditorSegmentHolder>
	
	"We perform a single dispatch on a segment type in order to support multiple types"
	^ aSegmentType holder
]

{ #category : #'hooks - cursor' }
BrTextEditor >> onCursorMoved: aFromIndex to: aToIndex [
	self notifyCursorMoved: aFromIndex to: aToIndex
]

{ #category : #hooks }
BrTextEditor >> onDetached: anEditorElement [
	super onDetached: anEditorElement.

	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorSelectionHandler ].
	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorInsertionHandler ].
	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorDeletionHandler ].

	self interactions do: [ :anInteraction | anEditorElement removeShortcut: anInteraction ].

	anEditorElement
		removeEventHandlersSuchThat: [ :aHandler | (aHandler isKindOf: BlEventHandler)
			and: [ { BlMouseDownEvent . BlFocusEvent . BlBlurEvent } includes: aHandler eventClass ] ]
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onStringInserted: aBrTextStringInserted [
	"Is sent after a string is inserted in a text model"

	self segmentBuilder
		insertedString: aBrTextStringInserted string
		at: aBrTextStringInserted index
		in: self.

	self styleText.

	self
		notifyInserted: (aBrTextStringInserted string asRopedText)
		at: aBrTextStringInserted index
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextDeleted: aBlTextDeleted [
	"Is sent after a piece of text was deleted in a text model"

	self segmentBuilder
		deletedFrom: aBlTextDeleted fromIndex
		to: aBlTextDeleted toIndex
		in: self.

	self styleText.
	
	self
		notifyDeletedFrom: aBlTextDeleted fromIndex
		to: aBlTextDeleted toIndex
]

{ #category : #'text - copy/paste' }
BrTextEditor >> paste [
	"A paste a text from the clipboard at the current cursor position.
	I delete any currently selected text and update cursor position"
	
	self paster
		fromClipboard;
		atCursor;
		paste
]

{ #category : #'api - modification' }
BrTextEditor >> paster [
	^ BrTextEditorPaster new editor: self
]

{ #category : #'private - selection' }
BrTextEditor >> prepareSelection [
	self selectionRecorder prepare: self
]

{ #category : #'private - selection' }
BrTextEditor >> recordDeselection: aMonotoneTextSelection [
	self selectionRecorder deselect: aMonotoneTextSelection in: self.
	
	(self selection + self selectionRecorder selection) isEmpty
		ifTrue: [ ^ self ].
		
	self moveCursorTo: (self selection + self selectionRecorder selection) to.
	self showCursor
]

{ #category : #'private - selection' }
BrTextEditor >> recordSelection: aMonotoneTextSelection [
	self selectionRecorder select: aMonotoneTextSelection in: self.

	(self selection + self selectionRecorder selection) isEmpty
		ifTrue: [ ^ self ].
		
	self moveCursorTo: (self selection + self selectionRecorder selection) to.
	self showCursor
]

{ #category : #accessing }
BrTextEditor >> segmentBuilder [
	<return: #BrTextEditorSegmentBuilder>

	^ segmentBuilder
]

{ #category : #accessing }
BrTextEditor >> segmentBuilder: aTextSegmentBuilder [
	"Change current segment builder to a new one and completely invalidate the structure"
	
	segmentBuilder := aTextSegmentBuilder.
	self notifyChanged
]

{ #category : #accessing }
BrTextEditor >> segmentBuilderDo: aBlock [
	aBlock value: segmentBuilder
]

{ #category : #accessing }
BrTextEditor >> segmentCollector [
	<return: #BrTextEditorSegmentCollector>

	^ segmentCollector
]

{ #category : #'private - text' }
BrTextEditor >> select: aFromTextIndex to: aToTextIndex [
	"Select text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"

	self selecter
		from: aFromTextIndex to: aToTextIndex;
		withoutCursorUpdate;
		select
]

{ #category : #'text - selection' }
BrTextEditor >> selectNone [
	"Deselect the whole text in the editor without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"

	self selection isEmpty
		ifTrue: [ ^ self ].

	self
		deselect: self selection from
		to: self selection to
]

{ #category : #'text - selection' }
BrTextEditor >> selectToLeft [
	| fromIndex toIndex newCursorPosition |
	
	self
		assert: [ self hasSelection not
			or: [ self cursor position = self selection from
				or: [ self cursor position = self selection to ] ] ]
		description: [ 'If there is selection cursor must be located either at the start or end of selection interval' ].
	
	"which also will be either start or the end of the selection"
	newCursorPosition := (self cursor position - 1) max: 0.

	self hasSelection
		ifTrue: [ 
			(self cursor position = self selection from)
				"Expand selection to the left"
				ifTrue: [
					fromIndex := newCursorPosition.
					toIndex := self selection to ]
				"Collapse selection to the left"
				ifFalse: [
					fromIndex := self selection from.
					toIndex := newCursorPosition ] ]
		ifFalse: [ 
			fromIndex := newCursorPosition.
			toIndex := self cursor position ].
	
	self selectNone.
	self
		select: fromIndex
		to: toIndex.

	self moveCursorTo: newCursorPosition.
]

{ #category : #'text - selection' }
BrTextEditor >> selectToRight [
	| fromIndex toIndex newCursorPosition |
	
	self
		assert: [ self hasSelection not
			or: [ self cursor position = self selection from
				or: [ self cursor position = self selection to ] ] ]
		description: [ 'If there is selection cursor must be located either at the start or end of selection interval' ].
	
	"which also will be either start or the end of the selection"
	newCursorPosition := (self cursor position + 1) min: self text size.

	self hasSelection
		ifTrue: [ 
			(self cursor position = self selection to)
				"Expand selection to the right"
				ifTrue: [
					fromIndex := self selection from.
					toIndex := newCursorPosition ]
				"Collapse selection to the right"
				ifFalse: [
					fromIndex := newCursorPosition .
					toIndex := self selection to ] ]
		ifFalse: [ 
			fromIndex := self cursor position.
			toIndex := newCursorPosition ].

	self selectNone.
	self
		select: fromIndex
		to: toIndex.

	self moveCursorTo: newCursorPosition.
]

{ #category : #'text - selection' }
BrTextEditor >> selectedText [
	<return: #BlText>
	
	^ self hasSelection
		ifTrue: [ self text copyFrom: self selection from + 1 to: self selection to ]
		ifFalse: [ self text empty ]
]

{ #category : #'api - modification' }
BrTextEditor >> selecter [
	^ BrTextEditorSelecter new editor: self
]

{ #category : #accessing }
BrTextEditor >> selection [
	<return: #BlSelection>

	^ selection
]

{ #category : #'private - selection' }
BrTextEditor >> selection: aTextSelection [
	selection := aTextSelection.
	
	"self selection isEmpty
		ifTrue: [ ^ self ].
	self moveCursorTo: self selection to.
	self showCursor"
]

{ #category : #accessing }
BrTextEditor >> selectionRecorder [
	<return: #BrTextEditorSelectionRecorder>

	self
		assert: [ selectionRecorder isNotNil ]
		description: [ 'Selection recorder can not be nil' ].

	^ selectionRecorder
]

{ #category : #'text - cursor' }
BrTextEditor >> showCursor [
	| aCommand |

	self cursor isVisible: true.
	
	aCommand := self newCursorChangeCommand
		position: self cursor position.
	self enqueueCommand: aCommand
]

{ #category : #'text - styling' }
BrTextEditor >> styleText [
	"I request styler to re-style my current text"
	
	self text isEmpty
		ifTrue: [ ^ self ].
	
	self text size > 200
		ifTrue: [ self styler styleInBackgroundProcess: self text nextGeneration ]
		ifFalse: [ self styler style: self text nextGeneration ]
]

{ #category : #accessing }
BrTextEditor >> styler [
	<return: #BrTextStyler>
	^ styler
]

{ #category : #accessing }
BrTextEditor >> styler: aStyler [
	styler removeEventHandler: stylerEventHandler.

	styler := aStyler.
	styler addEventHandler: stylerEventHandler.
	
	"styler changed, let's restyle the text"
	self styleText
]

{ #category : #accessing }
BrTextEditor >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrTextEditor >> text: aBrText [
	
	"before changing the text we must unsubscribe from existing one"	
	text unsubscribe: self.

	text := aBrText.
	self initializeText: text.

	"Replacing text instance means that we can not guarantee structural integrity
	of existing cache and have to rebuild it invalidating the whole underlying model structure"
	segmentCollector := self defaultSegmentCollector.
	segmentCollector editor: self.
	segmentCollector text: text.

	"notify UI about structural update"
	self notifyChanged.

	"text changed, we should style it"
	self styleText
]

{ #category : #'private - updating' }
BrTextEditor >> update: aFromTextIndex to: aToTextIndex [
	"Update text rendering within an interval defined by provided from and to indices."
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newUpdateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand
]

{ #category : #'private - updating' }
BrTextEditor >> updateAll [
	"Update rendering of the whole text within the editor"
	| aCommand |
	
	aCommand := self newUpdateCommand
		fromIndex: self segmentCollector start;
		toIndex: self segmentCollector end.
	self enqueueCommand: aCommand
]

{ #category : #'private - updating' }
BrTextEditor >> updateSelection: aFromTextIndex to: aToTextIndex [
	"Update text rendering within an interval defined by provided from and to indices."
	| aCommand |
	
	aCommand := self newSelectionUpdateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand
]
