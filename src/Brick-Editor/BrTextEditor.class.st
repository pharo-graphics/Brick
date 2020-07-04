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
		'mode',
		'text',
		'selection',
		'selectionRecorder',
		'segmentBuilder',
		'segmentCollector',
		'styler',
		'stylerStrategy',
		'stylerEventHandler',
		'interactions',
		'cursors',
		'attachedElements',
		'history',
		'filter'
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

{ #category : #'api - interactions' }
BrTextEditor >> addInteraction: aBrTextEditorInteraction [

	(aBrTextEditorInteraction isKindOf: BrTextEditorInteraction)
		ifFalse: [ self error: ('Interaction should be an instance of {1} but was {2}' format: { BrTextEditorInteraction . aBrTextEditorInteraction class }) ].

	self interactions
		add: aBrTextEditorInteraction
		ifAdded: [ :aNewInteraction | self onInteractionAdded: aNewInteraction ]
		ifReplaced: [ :aPreviousInteraction | self onInteractionRemoved: aPreviousInteraction ]
]

{ #category : #'api - interactions' }
BrTextEditor >> addInteractions: aCollectionOfBrTextEditorInteraction [
	aCollectionOfBrTextEditorInteraction
		do: [ :eachInteraction | self addInteraction: eachInteraction ]
]

{ #category : #asserting }
BrTextEditor >> assertUIProcess [
	"I check if the current process is a UI process of all attached editor elements"
	| aCurrentProcess allUIProcesses |
	
	aCurrentProcess := Processor activeProcess.	
	allUIProcesses := self uiProcesses.
	
	(allUIProcesses size <= 1)
		ifFalse: [ BrEditorWrongThreadError signal: 'The editor is attached to multiple elements from different UI processes' ].
		
	(allUIProcesses isEmpty or: [ allUIProcesses anyOne == aCurrentProcess ])
		ifFalse: [ BrEditorWrongThreadError signal: ('I am running from a non-UI process ({1}) expected ({2})'
				format: { aCurrentProcess asString . allUIProcesses anyOne asString }) ].
]

{ #category : #'api - mode' }
BrTextEditor >> beEditable [
	self editorMode: BrTextEditorEditableMode new
]

{ #category : #'api - mode' }
BrTextEditor >> beEditableCode [
	self editorMode: BrTextEditorEditableCodeMode new
]

{ #category : #'api - mode' }
BrTextEditor >> beReadOnlyWithSelection [
	self editorMode: BrTextEditorReadonlyWithSelectionMode new
]

{ #category : #'api - mode' }
BrTextEditor >> beReadOnlyWithoutSelection [
	self editorMode: BrTextEditorReadonlyWithoutSelectionMode new
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
				anEvent afterAction cull: self text cull: self.
				self updater
					all;
					update ]
			ifFalse: [
				Bloc debugModeEnabled
					ifTrue: [ Error signal: 'Wrong generation!' ].
				self styleTextAndAfterDo: anEvent afterAction ] ]
]

{ #category : #initialization }
BrTextEditor >> defaultStylerStrategy [
	^ BrTextStylerTaskItStrategy new
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
	<return: #BrTextEditorDeselecter>

	^ BrTextEditorDeselecter new editor: self
]

{ #category : #'api - mode' }
BrTextEditor >> editorMode [
	<return: #BrTextEditorMode>

	^ mode
]

{ #category : #'api - mode' }
BrTextEditor >> editorMode: aBrTextEditorMode [
	self
		assert: [ aBrTextEditorMode isNotNil ]
		description: [ 'Mode must not be nil' ].
	
	mode = aBrTextEditorMode
		ifTrue: [ ^ self ].

	"Uninstall existing mode"
	mode uninstallFromEditor: self.
	attachedElements do: [ :eachElement | mode uninstallFromEditorElement: eachElement ].

	mode := aBrTextEditorMode.
	mode installOnEditor: self.
	attachedElements do: [ :eachElement | mode installOnEditorElement: eachElement ].
	
	self notifyChanged
]

{ #category : #'commands - processing' }
BrTextEditor >> enqueueCommand: aBrTextEditorCommand [
	(BrTextEditorCommandSignal textEditor: self)
		command: aBrTextEditorCommand;
		emit.

	aBrTextEditorCommand executeOn: self
]

{ #category : #'commands - processing' }
BrTextEditor >> enqueueHolderCommand: aBrTextEditorHolderCommand interval: aTextInterval [
	(BrTextEditorHolderCommandSignal textEditor: self)
		command: aBrTextEditorHolderCommand;
		interval: aTextInterval;
		emit.

	self
		notifyItems: aTextInterval
		event: aBrTextEditorHolderCommand
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

{ #category : #accessing }
BrTextEditor >> history [
	<return: #BrTextEditorHistory>
	
	^ history
]

{ #category : #initialization }
BrTextEditor >> initialize [
	super initialize.
	
	mode := BrTextEditorNullMode new.
	
	attachedElements := Set new.
	
	filter := BrTextEditorNoInputFilter new.
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
	self useDefaultStylerStrategy.
	
	interactions := BrTextEditorInteractions new.
	history := BrTextEditorHistory new.

	self beEditable
]

{ #category : #'api - interactions' }
BrTextEditor >> initializeMacInteractions [
	"Add and override key definitions which are Mac specific"

	self addInteraction: (BlShortcut new
		combination: (BlKeyCombination builder primary arrowLeft build);
		action: [ self moveCursorToLineStart ]).

	self addInteraction: (BlShortcut new
		combination: (BlKeyCombination builder primary arrowRight build);
		action: [ self moveCursorToLineEnd ])
]

{ #category : #initialization }
BrTextEditor >> initializeText: aBrText [
	aBrText when: BlTextStringsInserted send: #onStringsInserted: to: self.
	aBrText when: BlTextsDeleted send: #onTextsDeleted: to: self.
	aBrText when: BlTextAttributeAdded send: #onTextAttributeAdded: to: self.
	aBrText when: BlTextAttributesRemoved send: #onTextAttributesRemoved: to: self.
]

{ #category : #'api - filter' }
BrTextEditor >> inputFilter [
	<return: #BrTextEditorInputFilter>

	^ filter
]

{ #category : #'api - filter' }
BrTextEditor >> inputFilter: aBrTextEditorInputFilter [
	filter := aBrTextEditorInputFilter
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

{ #category : #'api - interactions' }
BrTextEditor >> interactions [
	<return: #BrTextEditorInteractions>

	^ interactions
]

{ #category : #'private - updating' }
BrTextEditor >> invalidate: aFromTextIndex to: aToTextIndex [
	"Update text rendering within an interval defined by provided from and to indices."
	
	self deprecated: 'Invalidation is deprecated and merged with updater'.

	self updater
		from: aFromTextIndex to: aToTextIndex;
		redrawOnly;
		update
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
	newPosition := newPosition max: 0.
	[ newPosition > 0 and: [ (self text at: newPosition) isSeparator ] ] whileTrue:
		[ newPosition := newPosition - 1 ].
	[ newPosition = 0 or: [ (self text at: newPosition) isSeparator ] ] whileFalse:
		[ newPosition := newPosition - 1 ].

	self moveCursorTo: newPosition
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
BrTextEditor >> notifyInteractionAdded: anInteraction [
	self dispatchEvent: (BrTextEditorInteractionAddedEvent new interaction: anInteraction)
]

{ #category : #'event firing' }
BrTextEditor >> notifyInteractionRemoved: anInteraction [
	self dispatchEvent: (BrTextEditorInteractionRemovedEvent new interaction: anInteraction)
]

{ #category : #'event firing' }
BrTextEditor >> notifyModified: aText [
	self dispatchEvent: (BrTextEditorModifiedEvent new text: aText)
]

{ #category : #'event firing' }
BrTextEditor >> notifySelelectedFrom: aFromIndex to: aToIndex [
	self dispatchEvent: (BrTextEditorSelectedEvent new fromIndex: aFromIndex; toIndex: aToIndex)
]

{ #category : #hooks }
BrTextEditor >> onAttached: anEditorElement [
	super onAttached: anEditorElement.

	attachedElements := attachedElements copyWith: anEditorElement.

 	mode installOnEditorElement: anEditorElement.
	interactions do: [ :eachInteraction | self onInteractionAdded: eachInteraction to: anEditorElement ].

	anEditorElement when: BlMouseUpEvent do: [ :anEvent | anEvent consumed: true ].
	anEditorElement when: BlClickEvent do: [ :anEvent | anEvent consumed: true ].
	anEditorElement when: BlFocusEvent do: [ self onGotFocus ].
	anEditorElement when: BlBlurEvent do: [ self onLostFocus ].

	self notifyChanged
]

{ #category : #'instance creation' }
BrTextEditor >> onBindHolder: aSegmentHolder at: aPosition [
	"I bind a segment at a given position to the provided segment holder"
	| aSegment previousLastIndex |

	"First we want to acquire a segment for a given position"
	aSegment := segmentCollector segmentAt: aPosition.
	"and than bind it to the holder"
	aSegmentHolder segment: aSegment.

	"If the last cached segment was requested, load more so that the editor knows there are more lines"
	(aPosition = segmentCollector lastIndex and: [ segmentCollector end < segmentCollector text size ])
		ifTrue: [
			previousLastIndex := segmentCollector lastIndex.
			segmentCollector computeForwardAt: aPosition + 1.
			self notifyItemsInserted: (aPosition + 1 to: aPosition + segmentCollector lastIndex - previousLastIndex) ]
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

	attachedElements := attachedElements copyWithout: anEditorElement.

	mode uninstallFromEditorElement: anEditorElement.
	interactions do: [ :eachInteraction | self onInteractionRemoved: eachInteraction from: anEditorElement ].

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

{ #category : #hooks }
BrTextEditor >> onInteractionAdded: anInteraction [
	attachedElements do: [ :eachElement | self onInteractionAdded: anInteraction to: eachElement ].
	self notifyInteractionAdded: anInteraction
]

{ #category : #hooks }
BrTextEditor >> onInteractionAdded: anInteraction to: anEditorElement [
	anEditorElement removeShortcutsWithCombination: anInteraction combination.
	anEditorElement addShortcut: anInteraction asShortcut
]

{ #category : #hooks }
BrTextEditor >> onInteractionRemoved: anInteraction [
	attachedElements do: [ :eachElement | self onInteractionRemoved: anInteraction from: eachElement ].
	self notifyInteractionRemoved: anInteraction
]

{ #category : #hooks }
BrTextEditor >> onInteractionRemoved: anInteraction from: anEditorElement [
	anEditorElement removeShortcutsWithCombination: anInteraction combination
]

{ #category : #'private - focus' }
BrTextEditor >> onLostFocus [
	self enqueueCommand: (self newFocusChangedCommand hasFocus: false)
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onStringsInserted: aBlTextStringsInserted [
	"Is sent after a few strings (or one) are inserted in a text model"
	self assertUIProcess.
	
	aBlTextStringsInserted strings
		with: aBlTextStringsInserted finalIndices
		do: [ :aString :anIndex |
			self segmentBuilder
				insertedString: aString
				at: anIndex
				in: self ].

	history
		insertedStrings: aBlTextStringsInserted strings
		undo: aBlTextStringsInserted finalIndices
		redo: aBlTextStringsInserted requestedIndices.

	aBlTextStringsInserted strings
		with: aBlTextStringsInserted finalIndices
		do: [ :aString :anIndex |
			self
				notifyInserted: aString asRopedText
				at: anIndex ].
			
	self notifyModified: self text.

	self styleText
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextAttributeAdded: aBlTextAttributeAdded [
	self assertUIProcess.

	self segmentBuilder
		addedAttribute: aBlTextAttributeAdded attribute
		from: aBlTextAttributeAdded fromIndex
		to: aBlTextAttributeAdded toIndex
		in: self
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextAttributesRemoved: aBlTextAttributesRemoved [
	self assertUIProcess.

	self segmentBuilder
		removedAttributesFrom: aBlTextAttributesRemoved fromIndex
		to: aBlTextAttributesRemoved toIndex
		in: self
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextsDeleted: aBlTextsDeleted [
	"Is sent after a piece of text was deleted in a text model"
	self assertUIProcess.

	aBlTextsDeleted finalIntervals
		do: [ :eachInterval |
			self segmentBuilder
				deletedFrom: eachInterval first
				to:  eachInterval last
				in: self ].

	history
		"text attributes may reference objects such as computation results in the editor and therefore we
		should remove such attributes"
		deletedTexts: (aBlTextsDeleted texts collect: [ :eachText | eachText copyWithoutExternalReferences ])
		undo: (aBlTextsDeleted finalIntervals collect: #first)
		redo: (aBlTextsDeleted requestedIntervals collect: #first).

	aBlTextsDeleted finalIntervals
		do: [ :eachInterval |
			self
				notifyDeletedFrom: eachInterval first
				to:  eachInterval last ].

	self notifyModified: self text.

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

{ #category : #'text - undo/redo' }
BrTextEditor >> redo [
	history redoOn: self
]

{ #category : #'api - interactions' }
BrTextEditor >> removeInteraction: aBrTextEditorInteraction [

	(aBrTextEditorInteraction isKindOf: BrTextEditorInteraction)
		ifFalse: [ self error: ('Interaction should be an instance of {1} but was {2}' format: { BrTextEditorInteraction . aBrTextEditorInteraction class }) ].

	self interactions
		remove: aBrTextEditorInteraction
		ifFound: [ :aPreviousInteraction | self onInteractionRemoved: aPreviousInteraction ]
]

{ #category : #'api - interactions' }
BrTextEditor >> removeInteractions: aCollectionOfBrTextEditorInteractions [
	aCollectionOfBrTextEditorInteractions do: [ :eachInteraction | self removeInteraction: eachInteraction ]
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
	
	self stylerStrategy styleTextInEditor: self afterDo: aBlock.
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
	self stylerStrategy ifNotNil: [ 
		self stylerStrategy styler: aStyler ].
	
	"styler changed, let's restyle the text"
	self styleText
]

{ #category : #accessing }
BrTextEditor >> stylerStrategy [
	<return: #BrTextStylerStrategy>
	^ stylerStrategy
]

{ #category : #accessing }
BrTextEditor >> stylerStrategy: aBrTextStylerStrategy [
	self 
		assert: [ aBrTextStylerStrategy isNotNil ] 
		description: [ 'Text styler strategy must be non-nil' ].
	self styler ifNotNil: [ 
		aBrTextStylerStrategy styler: self styler ].
	stylerStrategy ifNotNil: [ 
		stylerStrategy view ifNotNil: [ :aView | 
			aBrTextStylerStrategy view: aView ] ].
	stylerStrategy := aBrTextStylerStrategy
]

{ #category : #'api - interactions' }
BrTextEditor >> surroundMap [
	"When inserting some special symbols a text editor should surround a cursor or selection with that symbol"

	| spaceBlock |
	spaceBlock := [ :anOperator :anIndex |
		(anOperator hasSpaceAroundIndex: anIndex)
			or: [ anOperator selection contains: anIndex ] ].

	^ BrTextEditorSurroundMap newFromArrays:
		{ 
			{ #'('. #')'. spaceBlock. }.
			{ #'"'. #'"'. spaceBlock. }.
			{ #''''. #''''. spaceBlock. }.
			{ #'['. #']'. spaceBlock. }.
			{ #'{'. #'}'. spaceBlock. }
		}
]

{ #category : #accessing }
BrTextEditor >> text [
	"Return a current text in the text editor. All modification to the text
	are reflected in the UI of the editor. For this reason I must only be
	used from a UI thread. To access a text from a non-UI thread use #textSnapshot
	which would give a copy of the current text"
	<return: #BlText>
	
	self assertUIProcess.
	^ text
]

{ #category : #accessing }
BrTextEditor >> text: aBrText [
	
	"when reducing the text size we should update the selection and cursor positions"
	(aBrText size < text size)
		ifTrue: [
			self navigator
				moveWithin: (0 to: aBrText size);
				apply.
			
			self deselecter
				from: aBrText size to: text size;
				deselect ].

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

{ #category : #accessing }
BrTextEditor >> textSnapshot [
	"Return a snaphost (copy) of the current text.
	I am safe to use from a non-UI thread because the returned text is independent from the
	current one and can be safely modified"
	<return: #BlText>

	^ text copy
]

{ #category : #asserting }
BrTextEditor >> uiProcesses [
	| theElementGroupedByProcess allUIProcesses |

	theElementGroupedByProcess := attachedElements groupedBy: [ :eachElement |
		| eachSpace eachUIProcess |
		eachSpace := eachElement isAttachedToSceneGraph
			ifTrue: [ eachElement space ]
			ifFalse: [ nil ].
		eachUIProcess := nil.
		eachSpace ifNotNil: [ eachSpace host uiProcessDo: [ :aProcess | eachUIProcess := aProcess ] ].
		eachUIProcess ].
	
	allUIProcesses := theElementGroupedByProcess keys reject: #isNil.

	^ allUIProcesses
]

{ #category : #'text - undo/redo' }
BrTextEditor >> undo [
	history undoOn: self
]

{ #category : #'private - updating' }
BrTextEditor >> update: aFromTextIndex to: aToTextIndex [
	"Invalidate segments (reset their internal cache) within text interval specified by from and to indices"
	
	self deprecated: 'Use editor updater unstead'.
	
	self updater
		from: aFromTextIndex to: aToTextIndex;
		update
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

{ #category : #'api - modification' }
BrTextEditor >> updater [
	<return: #BrTextEditorUpdater>

	^ BrTextEditorUpdater new editor: self
]

{ #category : #initialization }
BrTextEditor >> useAsyncStylerStrategy [
	self stylerStrategy: BrTextStylerAsyncStrategy new.
]

{ #category : #initialization }
BrTextEditor >> useDefaultStylerStrategy [
	self stylerStrategy: self defaultStylerStrategy
]

{ #category : #initialization }
BrTextEditor >> useSyncStylerStrategy [
	self stylerStrategy: BrTextStylerSyncStrategy new.
]

{ #category : #initialization }
BrTextEditor >> useTaskItStylerStrategy [
	self stylerStrategy: BrTextStylerTaskItStrategy new.
]

{ #category : #accessing }
BrTextEditor >> view: aBlElement [
	"Some objects may need a Bloc widget to enqueue some UI-level changes, e.g., 
		styling test in a background process."
	self stylerStrategy view: aBlElement.
]
