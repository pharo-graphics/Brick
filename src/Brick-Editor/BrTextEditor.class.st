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
		'model',
		'mode',
		'text',
		'selection',
		'selectionRecorder',
		'segmentBuilder',
		'segmentCollector',
		'styler',
		'stylerStrategy',
		'stylerEventHandler',
		'cursors',
		'attachedElements',
		'history',
		'filter',
		'shortcuts'
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

{ #category : #'api - shortcuts' }
BrTextEditor >> addEditorShortcut: aBrTextEditorShortcut [
	self editorShortcuts
		add: aBrTextEditorShortcut
		ifAdded: [ :aNewEditorShortcut | self onShortcutAdded: aNewEditorShortcut ]
		ifReplaced: [ :aPreviousEditorShortcut | self onShortcutRemoved: aPreviousEditorShortcut ]
]

{ #category : #'api - shortcuts' }
BrTextEditor >> addEditorShortcuts: aCollectionOfBrTextEditorShortcut [
	aCollectionOfBrTextEditorShortcut
		do: [ :eachShortcut | self addEditorShortcut: eachShortcut ]
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

{ #category : #accessing }
BrTextEditor >> beLineBased [
	segmentBuilder := BrTextEditorLineSegmentBuilder new splitter: BrTextEditorLineSplitter new
]

{ #category : #accessing }
BrTextEditor >> beParagraphBased [
	segmentBuilder := BrTextEditorLineSegmentBuilder new splitter: BrTextEditorParagraphSplitter new
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
	<return: #BrTextEditorCursor>

	self
		deprecated: 'Use #cursors instead.'
		transformWith: '`@receiver cursor' -> '`@receiver cursors'.

	^ cursors
]

{ #category : #accessing }
BrTextEditor >> cursors [
	<return: #BrTextEditorCursor>

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
	^ BlEventHandler
		on: BlTextStyledEvent
		do: [ :anEvent | self onTextStyled: anEvent ]
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

{ #category : #'api - shortcuts' }
BrTextEditor >> editorShortcuts [
	<return: #BrTextEditorShortcuts>

	^ shortcuts
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
	
	shortcuts := BrTextEditorShortcuts new.
	history := BrTextEditorHistory new.

	self beEditable.
	"self beParagraphBased"
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

{ #category : #accessing }
BrTextEditor >> model [
	^ model
]

{ #category : #accessing }
BrTextEditor >> model: anObject [
	model := anObject
]

{ #category : #'text - cursor' }
BrTextEditor >> moveCursorTo: aTextIndex [
	"Moves cursor to a given position without any further action such as cancelling selection"
	<event: #BrTextEditorCursorMovedEvent>

	self navigator
		moveTo: aTextIndex;
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

{ #category : #'private - cursor' }
BrTextEditor >> notifyAttributesOutsideCursor: aCollectionOfAttributes [
	"I notify the cursor attributes that they are not anymore within the current cursors"
	| theEventHandlingAttributes anEvent |
	
	theEventHandlingAttributes := (aCollectionOfAttributes select: [ :eachAttribute | eachAttribute isEventHandler ]) asSet.
	
	anEvent := BrTextEditorCursorRemovedEvent cursor: self cursors.
	
	theEventHandlingAttributes do: [ :eachAttribute |
		(eachAttribute wantsEvent: anEvent in: self)
				ifTrue: [ eachAttribute handleEvent: anEvent in: self on: nil ] ]
]

{ #category : #'private - cursor' }
BrTextEditor >> notifyAttributesWithinCursor: aCollectionOfAttributes [
	"I select and notify those attributes in the given collection that are within any of the cursors"
	| theEventHandlingAttributes anEvent |
	
	anEvent := BrTextEditorCursorAddedEvent cursor: self cursors.
	
	theEventHandlingAttributes := (aCollectionOfAttributes select: [ :eachAttribute | eachAttribute isEventHandler ]) asSet.
	theEventHandlingAttributes do: [ :eachAttribute |
		self text
			findAttribute: eachAttribute
			indicesDo: [ :aStart :anEnd |
				(self cursors anySatisfy: [ :eachCursor |
					eachCursor position between: ((aStart - 1) max: 0) and: anEnd ])
						ifTrue: [
							(eachAttribute wantsEvent: anEvent in: self)
								ifTrue: [ eachAttribute handleEvent: anEvent in: self on: nil ] ] ] ]
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
	shortcuts do: [ :eachInteraction | self onInteractionAdded: eachInteraction to: anEditorElement ].

	anEditorElement when: BlMouseUpEvent do: [ :anEvent | anEvent consumed: true ].
	anEditorElement when: BlClickEvent do: [ :anEvent | anEvent consumed: true ].
	anEditorElement when: BlFocusInEvent do: [ self onGotFocus ].
	anEditorElement when: BlFocusOutEvent do: [ self onLostFocus ].

	self notifyChanged
]

{ #category : #'instance creation' }
BrTextEditor >> onBindHolder: aSegmentHolder at: aPosition [
	"I bind a segment at a given position to the provided segment holder"
	| aSegment previousLastIndex |

	"First we want to acquire a segment for a given position"
	aSegmentHolder infiniteElement telemetry
		timeSync: [ 'Get segment at {1}' format: { aPosition } ]
		during: [ aSegment := segmentCollector segmentAt: aPosition. ].

	"and then bind it to the holder"
	aSegmentHolder infiniteElement telemetry
		timeSync: [ 'Set segment at {1}' format: { aPosition } ]
		during: [ aSegmentHolder segment: aSegment ].

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
	shortcuts do: [ :eachInteraction | self onInteractionRemoved: eachInteraction from: anEditorElement ].

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
BrTextEditor >> onInteractionAdded: anInteraction to: anEditorElement [
	anEditorElement removeShortcutsWithCombination: anInteraction combination.
	anEditorElement addShortcut: anInteraction asShortcut
]

{ #category : #hooks }
BrTextEditor >> onInteractionRemoved: anInteraction from: anEditorElement [
	anEditorElement removeShortcutsWithCombination: anInteraction combination
]

{ #category : #'private - focus' }
BrTextEditor >> onLostFocus [
	self enqueueCommand: (self newFocusChangedCommand hasFocus: false)
]

{ #category : #hooks }
BrTextEditor >> onShortcutAdded: anInteraction [
	attachedElements do: [ :eachElement | self onInteractionAdded: anInteraction to: eachElement ].
	self notifyInteractionAdded: anInteraction
]

{ #category : #hooks }
BrTextEditor >> onShortcutRemoved: anInteraction [
	attachedElements do: [ :eachElement | self onInteractionRemoved: anInteraction from: eachElement ].
	self notifyInteractionRemoved: anInteraction
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
		in: self.

	self notifyAttributesWithinCursor: { aBlTextAttributeAdded attribute }
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextAttributesRemoved: aBlTextAttributesRemoved [
	self assertUIProcess.

	self segmentBuilder
		removedAttributesFrom: aBlTextAttributesRemoved fromIndex
		to: aBlTextAttributesRemoved toIndex
		in: self.
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextReplaced [
	"Is sent after a text instance is replaced with a new one"
	self assertUIProcess.
		
	self processCursorAttributes
]

{ #category : #'hooks - text modifications' }
BrTextEditor >> onTextStyled: aBlTextStyledEvent [
	self assertUIProcess.

	(aBlTextStyledEvent text previousGeneration == self text generation)
		ifTrue: [
			self text rope: aBlTextStyledEvent text text rope.
			aBlTextStyledEvent afterAction cull: self text cull: self.
			
			"notify the event handling attributes that they are within the cursors"
			self processCursorAttributes.
			
			self updater
				all;
				update ]
		ifFalse: [ self styleTextAndAfterDo: aBlTextStyledEvent afterAction ]
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

{ #category : #'private - cursor' }
BrTextEditor >> processCursorAttributes [
	"I search for the attributes that are within any of the cursors and notify them about it"

	self processCursorAttributesFrom: (1 min: self text size) to: self text size
]

{ #category : #'private - cursor' }
BrTextEditor >> processCursorAttributesFrom: aFromIndex to: aToIndex [
	"I search for the attributes that are within any of the cursors and notify them about it"
	| anIterator anEnteredEvent aLeavedEvent |
	
	anEnteredEvent := BrTextEditorCursorAddedEvent cursor: self cursors.
	aLeavedEvent := BrTextEditorCursorRemovedEvent cursor: self cursors.

	anIterator := self text iterator: aFromIndex to: aToIndex.
	[ anIterator hasNext ]
		whileTrue: [
			anIterator
				nextAttributedEnd: [ :eachAttribute | eachAttribute isEventHandler ]
				indicesDo: [ :aStart :anEnd :theEndedAttributes |
					theEndedAttributes do: [ :eachAttribute |
						self text
							findAttribute: eachAttribute
							indicesDo: [ :eachStart :eachEnd |
								| anEvent |
								anEvent := (self cursors anySatisfy: [ :eachCursor | eachCursor position between: (aStart - 1 max: 0) and: anEnd ])
									ifTrue: [ anEnteredEvent ]
									ifFalse: [ aLeavedEvent ].
								(eachAttribute wantsEvent: anEvent in: self)
									ifTrue: [ eachAttribute handleEvent: anEvent in: self on: nil ] ] ] ] ].
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

{ #category : #'api - shortcuts' }
BrTextEditor >> removeAllEditorShortcuts [
	self editorShortcuts
		removeAllShortcutsAndDo: [ :aPreviousShortcut | self onShortcutRemoved: aPreviousShortcut ]
]

{ #category : #'api - shortcuts' }
BrTextEditor >> removeEditorShortcut: aBrTextEditorShortcut [
	self editorShortcuts
		remove: aBrTextEditorShortcut
		ifFound: [ :aPreviousShortcut | self onShortcutRemoved: aPreviousShortcut ]
]

{ #category : #'api - shortcuts' }
BrTextEditor >> removeEditorShortcuts: aCollectionOfBrTextEditorShortcut [
	aCollectionOfBrTextEditorShortcut do: [ :eachShortcut | self removeEditorShortcut: eachShortcut ]
]

{ #category : #'api - save state' }
BrTextEditor >> restoreState: aBrTextEditorMemento [
	| aSelecter aNavigator |
	self assertUIProcess.
	
	self setEditorShortcuts: aBrTextEditorMemento shortcuts.
	self editorMode: aBrTextEditorMemento mode.
	history := aBrTextEditorMemento history.
	styler := aBrTextEditorMemento styler.
	filter := aBrTextEditorMemento filter.
	
	self text: aBrTextEditorMemento text copy.
	
	self deselecter all deselect.
	aSelecter := self selecter withoutCursorUpdate.
	aBrTextEditorMemento selection
		do: [ :eachMonotoneSelection | aSelecter from: eachMonotoneSelection from to: eachMonotoneSelection to ].
	aSelecter select.
	
	aNavigator := self navigator removeAll.
	aNavigator withoutResettingDesiredCoordinate.
	aBrTextEditorMemento cursor do: [ :eachCursor | aNavigator add: eachCursor ].
	aNavigator apply
]

{ #category : #'api - save state' }
BrTextEditor >> saveState [
	<return: #BrTextEditorMemento>
	self assertUIProcess.
	
	^ BrTextEditorMemento new
		text: text copy;
		cursor: cursors copy;
		selection: selection copy;
		styler: styler copy;
		filter: filter copy;
		history: history copy;
		shortcuts: shortcuts copy;
		mode: mode copy
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

{ #category : #'api - shortcuts' }
BrTextEditor >> setEditorShortcuts: aBrTextEditorShortcuts [
	self
		assert: [ aBrTextEditorShortcuts isKindOf: BrTextEditorShortcuts ]
		description: [ 'Must be an editor shortcuts object' ].
	
	self removeAllEditorShortcuts.
	
	shortcuts := aBrTextEditorShortcuts.
	shortcuts do: [ :aNewEditorShortcut | self onShortcutAdded: aNewEditorShortcut ]
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

{ #category : #'api - shortcuts' }
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

	self onTextReplaced.

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
