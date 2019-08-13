"
! The Moldable Editor

I edit text and provide high level abstractions of essential text editor functionality such as selection, cursor, text insertions and deletions.

I make use of ${class:BrTextAdornmentAttribute}$ to augment text with visual elements. 

I subclass infinite data source in order to be able to smoothly display practically infinite amounts of text.
"
Class {
	#name : #BrTextEditor,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'text',
		'selection',
		'selectionRecorder',
		'segmentBuilder',
		'segmentCollector',
		'styler',
		'commandMutex',
		'stylerEventHandler',
		'interactions',
		'cursors'
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
	^ cursors
]

{ #category : #accessing }
BrTextEditor >> cursors [
	^ cursors
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
BrTextEditor >> defaultCursors [
	<return: #BrTextEditorCursor>

	^ BrTextEditorMultipleCursor new
]

{ #category : #initialization }
BrTextEditor >> defaultSegmentBuilder [
	^ BrTextEditorLineSegmentBuilder new
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
	^ BlTextNullStyler new
]

{ #category : #initialization }
BrTextEditor >> defaultStylerEventHandler [
	^ BlEventHandler on: BlTextStyledEvent do: [ :anEvent |		
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

{ #category : #accessing }
BrTextEditor >> gtStringFor: aView [
	<gtView>
	^ (self text 
		gtStringFor: aView)
		priority: 5
]

{ #category : #'text - selection' }
BrTextEditor >> hasSelection [
	"Return true of there is at least one selected character, false otherwise"
	<return: #Boolean>
	
	^ self selection isNotEmpty
]

{ #category : #initialization }
BrTextEditor >> initialize [
	super initialize.
	
	cursors := self defaultCursors.
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
		combination: BlKeyCombination delete;
		action: [
			self deleter
				selected;
				oneAfterCursor;
				delete ]).
	
	self interactions add: (BlShortcut new
		combination: BlKeyCombination backspace;
		action: [
			self deleter
				selected;
				oneBeforeCursor;
				delete ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination return;
		action: [
			self inserter
				atCursor;
				lineEndingWithWhitespace;
				insert ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination tab;
		action: [
			self selection isEmpty
				ifTrue: [
					self inserter
						atCursor;
						indentation;
						insert ]
				ifFalse: [
					self inserter
						indentation;
						beforeSelectedLines;
						withoutSelectionDelete;
						insert ] ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination primaryA;
		action: [ self selecter all select ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination primaryX;
		action: [ self cutSelected ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination primaryC;
		action: [ self copySelected ]).

	"Paste a text from the clipboard at the current cursor position.
	I delete any currently selected text and update cursor position"
	self interactions add: (BlShortcut new
		combination: BlKeyCombination primaryV;
		action: [ self paster fromClipboard atCursor paste ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination escape;
		action: [ self selectNone ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift arrowLeft build);
		action: [
			self selecter
				withoutCursorUpdate;
				moveOneToLeft;
				select.
			self navigator
				moveLeft;
				apply ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift arrowRight build);
		action: [
			self selecter
				withoutCursorUpdate;
				moveOneToRight;
				select.
			self navigator
				moveRight;
				apply ]).
			
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift arrowUp build);
		action: [
			self selecter
				withoutCursorUpdate;
				moveOneUp;
				select.
			self navigator
				moveUp;
				apply ]).
			
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder shift arrowDown build);
		action: [
			self selecter
				withoutCursorUpdate;
				moveOneDown;
				select.
			self navigator
				moveDown;
				apply ]).

	"left-arrow => move cursor left and deselect everything"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder arrowLeft build);
		action: [
			self deselecter all deselect.
			self navigator
				moveLeft;
				apply ]).

	"right-arrow => move cursor right and deselect everything"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder arrowRight build);
		action: [
			self deselecter all deselect.
			self navigator
				moveRight;
				apply ]).

	"up-arrow => move cursor up"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder arrowUp build);
		action: [ self moveCursorUp ]).

	"down-arrow => move cursor down"
	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder arrowDown build);
		action: [ self moveCursorDown ]). 

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder primary arrowRight build);
		action: [ self moveCursorToEndNextWord ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder primary arrowLeft build);
		action: [ self moveCursorToStartPreviousWord ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination home;
		action: [ self moveCursorToLineStart ]).

	self interactions add: (BlShortcut new
		combination: BlKeyCombination end;
		action: [ self moveCursorToLineEnd ]).

	"Callback for platform specific interactions"
	OSPlatform current initializeBrickInteractionsFor: self
]

{ #category : #interactions }
BrTextEditor >> initializeMacInteractions [
	"Add and override key definitions which are Mac specific"

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder primary arrowLeft build);
		action: [ self moveCursorToLineStart ]).

	self interactions add: (BlShortcut new
		combination: (BlKeyCombination builder primary arrowRight build);
		action: [ self moveCursorToLineEnd ])

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
	"Update text rendering within an interval defined by provided from and to indices."

	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newInvalidateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand
]

{ #category : #'private - updating' }
BrTextEditor >> invalidateAll [
	"Invalidate the rendering (request the redraw, don't create new segments or words)"
	| aCommand |

	aCommand := self newInvalidateCommand
		fromIndex: self segmentCollector start;
		toIndex: self segmentCollector end.
	self enqueueCommand: aCommand
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
BrTextEditor >> moveCursorDown [
	"Moves cursor down by one line without any other side effects.
	Note:
		- I don't change current selection.
		- I request segments update"

	self navigator
		moveDown;
		apply
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorTo: aTextIndex [
	"Moves cursor to a given position without any further action such as cancelling selection"
	<event: #BrTextEditorCursorMovedEvent>

	self navigator
		moveTo: aTextIndex;
		apply
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorToEndNextWord [
	| textIterator newPosition |
	"Moves cursor to the end of the next word"

	newPosition := self cursor first position.
	textIterator := self text iterator: (newPosition max: 1) to: self text size.
	[ textIterator hasNext and: [ newPosition = self cursor first position ] ] whileTrue: [
		| skip |
		skip := textIterator peek isSeparator.
		textIterator nextWord.
		skip ifFalse: [ newPosition := textIterator position ] ].

	self moveCursorTo: newPosition
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorToLineEnd [
	"Moves cursors to the end if their corresponding lines.
	Note:
		- I don't change current selection.
		- I request segments update"

	self navigator
		moveToLineEnd;
		apply
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorToLineStart [
	"Moves cursors to the start if their corresponding lines.
	Note:
		- I don't change current selection.
		- I request segments update"

	self navigator
		moveToLineStart;
		apply
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorToStartPreviousWord [
	| newPosition |
	"Moves cursor to the left by one character"

	newPosition := self cursor first position - 1.
	[ newPosition > 0 and: [ (self text at: newPosition) isSeparator ] ] whileTrue:
		[ newPosition := newPosition - 1 ].
	[ newPosition = 0 or: [ (self text at: newPosition) isSeparator ] ] whileFalse:
		[ newPosition := newPosition - 1 ].

	newPosition := newPosition max: 0.
	self moveCursorTo: newPosition
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorUp [
	"Moves cursor up by one line without any other side effects.
	Note:
		- I don't change current selection.
		- I request segments update"

	self navigator
		moveUp;
		apply
]

{ #category : #'api - modification' }
BrTextEditor >> navigator [
	^ BrTextEditorNavigator new editor: self
]

{ #category : #'commands - creation' }
BrTextEditor >> newFocusChangedCommand [
	^ BrTextEditorFocusChangedCommand new
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
BrTextEditor >> notifyDeletedFrom: aFromIndex to: aToIndex [
	self dispatchEvent: (BrTextEditorDeletedEvent new
		editor: self;
		fromIndex: aFromIndex;
		toIndex: aToIndex)
]

{ #category : #'event firing' }
BrTextEditor >> notifyDeselelected [
	self dispatchEvent: (BrTextEditorDeselectedEvent new)
]

{ #category : #'event firing' }
BrTextEditor >> notifyInserted: aText at: aTextIndex [
	self dispatchEvent: (BrTextEditorInsertedEvent text: aText at: aTextIndex)
]

{ #category : #'event firing' }
BrTextEditor >> notifySelelectedFrom: aFromIndex to: aToIndex [
	self dispatchEvent: (BrTextEditorSelectedEvent new fromIndex: aFromIndex; toIndex: aToIndex)
]

{ #category : #hooks }
BrTextEditor >> onAttached: anEditorElement [
	super onAttached: anEditorElement.

	anEditorElement addEventHandler: BrTextEditorSelectionHandler new.
	anEditorElement addEventHandler: BrTextEditorInsertionHandler new.
	anEditorElement addEventHandler: BrTextEditorMouseDownHandler uniqueInstance.

	self interactions do: [ :anInteraction | anEditorElement addShortcut: anInteraction ].

	anEditorElement when: BlMouseUpEvent do: [ :anEvent | anEvent consumed: true ].
	anEditorElement when: BlClickEvent do: [ :anEvent | anEvent consumed: true ].
	anEditorElement when: BlFocusEvent do: [ self onGotFocus ].
	anEditorElement when: BlBlurEvent do: [ self onLostFocus ].

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

{ #category : #hooks }
BrTextEditor >> onDetached: anEditorElement [
	super onDetached: anEditorElement.

	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorSelectionHandler ].
	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorInsertionHandler ].
	anEditorElement removeEventHandlersSuchThat: [ :aHandler | aHandler isKindOf: BrTextEditorMouseDownHandler ].

	self interactions do: [ :anInteraction | anEditorElement removeShortcut: anInteraction ].

	anEditorElement
		removeEventHandlersSuchThat: [ :aHandler | (aHandler isKindOf: BlEventHandler)
			and: [ { BlMouseUpEvent . BlClickEvent . BlFocusEvent . BlBlurEvent } includes: aHandler eventClass ] ]
]

{ #category : #hooks }
BrTextEditor >> onElementRecycled: anElementHolder [
	super onElementRecycled: anElementHolder.
	
	anElementHolder onRecycled
]

{ #category : #'private - focus' }
BrTextEditor >> onGotFocus [

	self cursors isEmpty
		ifTrue: [ self navigator moveTo: 0; apply ].

	self enqueueCommand: (self newFocusChangedCommand hasFocus: true)
]

{ #category : #'private - focus' }
BrTextEditor >> onLostFocus [
	self enqueueCommand: (self newFocusChangedCommand hasFocus: false)
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onStringInserted: aBrTextStringInserted [
	"Is sent after a string is inserted in a text model"

	self segmentBuilder
		insertedString: aBrTextStringInserted string
		at: aBrTextStringInserted index
		in: self.

	self
		notifyInserted: (aBrTextStringInserted string asRopedText)
		at: aBrTextStringInserted index.

	self styleText
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextDeleted: aBlTextDeleted [
	"Is sent after a piece of text was deleted in a text model"

	self segmentBuilder
		deletedFrom: aBlTextDeleted fromIndex
		to: aBlTextDeleted toIndex
		in: self.
	
	self
		notifyDeletedFrom: aBlTextDeleted fromIndex
		to: aBlTextDeleted toIndex.

	self styleText
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
		
	self moveCursorTo: (self selection + self selectionRecorder selection) to
]

{ #category : #'private - selection' }
BrTextEditor >> recordSelection: aMonotoneTextSelection [
	self selectionRecorder select: aMonotoneTextSelection in: self.

	(self selection + self selectionRecorder selection) isEmpty
		ifTrue: [ ^ self ].
		
	self moveCursorTo: (self selection + self selectionRecorder selection) to
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
BrTextEditor >> selectedText [
	<return: #BlText>
	
	^ self hasSelection
		ifTrue: [ self text copyFrom: self selection from + 1 to: self selection to ]
		ifFalse: [ self text empty ]
]

{ #category : #'api - modification' }
BrTextEditor >> selecter [
	<return: #BrTextEditorSelecter>

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

{ #category : #'text - styling' }
BrTextEditor >> styleText [
	"I request styler to re-style my current text"
	
	self styleTextAndAfterDo: [ "do nothing" ]
]

{ #category : #'text - styling' }
BrTextEditor >> styleTextAndAfterDo: aBlock [
	"I first style, and then I do aBlock once I am finished"
	
	self text isEmpty ifTrue: [ ^ self ].
	self styler style: self text nextGeneration afterDo: aBlock.
]

{ #category : #accessing }
BrTextEditor >> styler [
	<return: #BlTextStyler>
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
	"Invalidate segments (reset their internal cache) within text interval specified by from and to indices"
	
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newUpdateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand
]

{ #category : #'private - updating' }
BrTextEditor >> updateAll [
	"Reset segments cache and recreate new words"
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
