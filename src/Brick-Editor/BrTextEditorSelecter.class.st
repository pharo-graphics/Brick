"
When in ""cursor update mode"" I place cursors at the end of each selection
"
Class {
	#name : #BrTextEditorSelecter,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'selection',
		'shouldUpdateCursor',
		'shouldDeselectExisting'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorSelecter >> all [
	"Select the whole text"
	self assertUIProcess.
	
	self
		from: 0
		to: self text size
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> all: aCompositeSelection [
	aCompositeSelection do: [ :eachMonotoneSelection |
		self from: eachMonotoneSelection from to: eachMonotoneSelection to ]
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> extendToLineEnd [
	"Extend selection to the end of the line"
	|  theCommands |
	self assertUIProcess.

	theCommands := self cursors collect: [ :aCursor |
		self
			privateExtendSelectionRightAt: aCursor position
			by: (self findTextIndexAtLineEnd: aCursor) - aCursor position ].
	
	self privatePerformSelectAndDeselectCommands: theCommands
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> extendToLineStart [
	"Extend selection to the start of the line"
	|  theCommands |
	self assertUIProcess.

	theCommands := self cursors collect: [ :aCursor |
		self
			privateExtendSelectionLeftAt: aCursor position
			by: aCursor position - (self findTextIndexAtLineStart: aCursor) ].

	self privatePerformSelectAndDeselectCommands: theCommands
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> extendToNextWordEnd [
	"Extend selection to the end of the next word"
	|  theCommands |
	self assertUIProcess.

	theCommands := self cursors collect: [ :aCursor |
		self
			privateExtendSelectionRightAt: aCursor position
			by: (self findWordEndAfter: aCursor position) - aCursor position ].
	
	self privatePerformSelectAndDeselectCommands: theCommands
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> extendToPreviousWordStart [
	"Extend selection to start of the previous word"
	|  theCommands |
	self assertUIProcess.

	theCommands := self cursors collect: [ :aCursor |
		self
			privateExtendSelectionLeftAt: aCursor position
			by: aCursor position - (self findWordStartBefore: aCursor position) ].
	
	self privatePerformSelectAndDeselectCommands: theCommands
]

{ #category : #private }
BrTextEditorSelecter >> findExistingSelectionEndAfter: aTextIndex within: aTextInterval [
	| anEndIndex |
	
	anEndIndex := aTextIndex.
	self selection do: [ :eachMonotoneSelection |
		(eachMonotoneSelection to between: aTextInterval first and: aTextInterval last)
			ifTrue: [ anEndIndex := anEndIndex max: eachMonotoneSelection to ].
	
		(eachMonotoneSelection to > aTextInterval last
			and: [ eachMonotoneSelection from <= aTextInterval last ])
				ifTrue: [ anEndIndex := aTextInterval last ] ].

	^ anEndIndex
]

{ #category : #private }
BrTextEditorSelecter >> findExistingSelectionStartBefore: aTextIndex within: aTextInterval [
	| aStartIndex |
	
	aStartIndex := aTextIndex.
	self selection do: [ :eachMonotoneSelection |
		(eachMonotoneSelection from between: aTextInterval first and: aTextInterval last)
			ifTrue: [ aStartIndex := aStartIndex min: eachMonotoneSelection from ].

		(eachMonotoneSelection from < aTextInterval first
			and: [ eachMonotoneSelection to >= aTextInterval first ])
				ifTrue: [ aStartIndex := aTextInterval first ] ].

	^ aStartIndex
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> from: aFromIndex to: aToIndex [
	self assertUIProcess.

	aFromIndex = aToIndex
		ifTrue: [ ^ self ].

	selection select: aFromIndex to: aToIndex
]

{ #category : #initialization }
BrTextEditorSelecter >> initialize [
	super initialize.

	selection := BlCompositeSelection new.
	shouldUpdateCursor := true.
	shouldDeselectExisting := false
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> moveOneDown [
	"Select and move a cursor one line down"
	| theNewCursorPositions theCursorsOnTheLeft theCursorsOnTheRight theCursorsOutside |
	self assertUIProcess.

	theNewCursorPositions := (self cursors collect: [ :aCursor |
		aCursor -> (self
			findTextIndexBelowCursor: aCursor
			ifAbsent: [
				(self isCursorOnTheLastLine: aCursor)
					ifTrue: [ self text size ]
					ifFalse: [ aCursor position ] ]) ]) as: OrderedIdentityDictionary.

	theCursorsOnTheLeft := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection from ] ].

	theCursorsOnTheRight := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection to ] ].

	theCursorsOutside := self cursors
		select: [ :aCursor | (self selection anySatisfy: [ :aSelection | aCursor position between: aSelection from and: aSelection to ]) not ].

	theCursorsOnTheLeft do: [ :aCursor |
		self editor deselecter
			from: aCursor position to: (theNewCursorPositions at: aCursor);
			deselect ].

	theCursorsOnTheRight, theCursorsOutside do: [ :aCursor | 
		self from: aCursor position to: ((theNewCursorPositions at: aCursor) min: self text size) ].
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> moveOneToLeft [
	"Select and move a cursor one character to the left"
	|  theCommands |
	self assertUIProcess.

	theCommands := self cursors collect: [ :aCursor |
		self
			privateExtendSelectionLeftAt: aCursor position
			by: 1 ].
	
	self privatePerformSelectAndDeselectCommands: theCommands
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> moveOneToRight [
	"Select and move a cursor one character to the right"
	|  theCommands |
	self assertUIProcess.

	theCommands := self cursors collect: [ :aCursor |
		self
			privateExtendSelectionRightAt: aCursor position
			by: 1 ].
	
	self privatePerformSelectAndDeselectCommands: theCommands
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> moveOneUp [
	"Select and move a cursor one line up"
	| theNewCursorPositions theCursorsOnTheLeft theCursorsOnTheRight theCursorsOutside |
	self assertUIProcess.

	theNewCursorPositions := (self cursors collect: [ :aCursor |
		aCursor -> (self
			findTextIndexAboveCursor: aCursor
			ifAbsent: [
				(self isCursorOnTheFirstLine: aCursor)
					ifTrue: [ 0 ]
					ifFalse: [ aCursor position ] ]) ]) as: OrderedIdentityDictionary.

	theCursorsOnTheLeft := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection from ] ].
		
	theCursorsOnTheRight := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection to ] ].
	
	theCursorsOutside := self cursors
		select: [ :aCursor | (self selection anySatisfy: [ :aSelection | aCursor position between: aSelection from and: aSelection to ]) not ].

	"the cursor is on the right side of the selection, we should deselect from the new potential position to its current location"
	theCursorsOnTheRight do: [ :aCursor |
		self editor deselecter
			from: (theNewCursorPositions at: aCursor) to: aCursor position;
			deselect ].
	
	"the cursor is on the left side of the selection or is not inside any selection, we should extend it to the new potential location"
	theCursorsOnTheLeft, theCursorsOutside do: [ :aCursor | 
		self from: (theNewCursorPositions at: aCursor) to: aCursor position ]
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> overwrite [
	"Deselect any selections if they exist and overwrite with the new selection"
	
	shouldDeselectExisting := true
]

{ #category : #private }
BrTextEditorSelecter >> privateDeselectExisting: aSelection [
	| aDeselecter |
	
	aSelection isEmpty
		ifTrue: [ ^ self ].

	aDeselecter := self editor deselecter.	
	aSelection do: [ :eachMonotoneSelection | aDeselecter from: eachMonotoneSelection from to: eachMonotoneSelection to ].
	aDeselecter deselect
]

{ #category : #private }
BrTextEditorSelecter >> privateExtendSelectionLeftAt: aTextPosition by: anAmount [
	| hasSelectionAfter toSelect toDeselect |

	toSelect := OrderedCollection new.
	toDeselect := OrderedCollection new.

	hasSelectionAfter := self selection
		anySatisfy: [ :eachMonotoneSelection |
			(eachMonotoneSelection from <= aTextPosition)
				and: [ eachMonotoneSelection to > aTextPosition ] ].

	hasSelectionAfter
		ifTrue: [ toSelect add: (BlSelection from: aTextPosition - anAmount to: aTextPosition) ]
		ifFalse: [
			| aSelectionStart aSelectionEnd |
			aSelectionEnd := self
				findExistingSelectionStartBefore: aTextPosition
				within: (aTextPosition - anAmount to: aTextPosition).
			
			aSelectionEnd = aTextPosition
				ifFalse: [ toDeselect add: (BlSelection from: aSelectionEnd to: aTextPosition) ].
				
			aSelectionStart := aTextPosition - anAmount.
			
			aSelectionStart = aSelectionEnd
				ifFalse: [ toSelect add: (BlSelection from: aSelectionStart to: aSelectionEnd) ] ].

	^ BrExtendSelectionCommand new 
		editor: editor;
		toSelect: toSelect;
		toDeselect: toDeselect
]

{ #category : #private }
BrTextEditorSelecter >> privateExtendSelectionRightAt: aTextPosition by: anAmount [
	| hasSelectionBefore toSelect toDeselect |

	toSelect := OrderedCollection new.
	toDeselect := OrderedCollection new.

	hasSelectionBefore := self selection
		anySatisfy: [ :eachMonotoneSelection |
			(eachMonotoneSelection from < aTextPosition)
				and: [ eachMonotoneSelection to >= aTextPosition ] ].

	hasSelectionBefore
		ifTrue: [ toSelect add: (BlSelection from: aTextPosition to: aTextPosition + anAmount) ]
		ifFalse: [
			| aSelectionStart aSelectionEnd |
			aSelectionStart := self
				findExistingSelectionEndAfter: aTextPosition
				within: (aTextPosition to: aTextPosition + anAmount).
			
			aSelectionStart = aTextPosition
				ifFalse: [ toDeselect add: (BlSelection from: aTextPosition to: aSelectionStart) ].
				
			aSelectionEnd := aTextPosition + anAmount.
			
			aSelectionStart = aSelectionEnd
				ifFalse: [ toSelect add: (BlSelection from: aSelectionStart to: aSelectionEnd) ] ].

	^ BrExtendSelectionCommand new 
		editor: editor;
		toSelect: toSelect;
		toDeselect: toDeselect
]

{ #category : #private }
BrTextEditorSelecter >> privatePerformSelectAndDeselectCommands: theCommands [
	| aDeselecter |
	aDeselecter := self editor deselecter.
	theCommands do: [ :aCommand |
		aCommand toDeselectDo: [ :eachSelectionToDeselect |
			aDeselecter
				from: eachSelectionToDeselect from
				to: eachSelectionToDeselect to ] ].
	aDeselecter deselect.
	theCommands do: [ :aCommand |
		aCommand toSelectDo: [ :eachSelectionToSelect |
			self
				from: eachSelectionToSelect from
				to: eachSelectionToSelect to ] ]
]

{ #category : #private }
BrTextEditorSelecter >> privateSelect: aFromTextIndex to: aToTextIndex [
	"Select text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	| aCommand |
	
	self
		assert: [ aFromTextIndex < aToTextIndex ]
		description: [ 'Must select at least one character' ].

	self
		assert: [ aFromTextIndex between: 0 and: self text size ]
		description: [ 'Selection start index ({1}) must be within text bounds {2}' format: { aFromTextIndex . 0 to: self text size } ].
	self
		assert: [ aToTextIndex between: 0 and: self text size ]
		description: [ 'Selection end index ({1}) must be within text bounds {2}' format: { aToTextIndex . 0 to: self text size } ].
	
	aCommand := BrTextEditorSelectCommand new
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self editor enqueueCommand: aCommand
]

{ #category : #'api - processing' }
BrTextEditorSelecter >> select [
	| toBeSelected |
	self assertUIProcess.

	selection isEmpty
		ifTrue: [ ^ self ].

	shouldDeselectExisting
		ifTrue: [
			| toBeDeselected |
			
			toBeDeselected := self selection copy.
			selection do: [ :aMonotoneSelection | toBeDeselected deselect: aMonotoneSelection from to: aMonotoneSelection to ].			
			self privateDeselectExisting: toBeDeselected ].
	
	toBeSelected := selection copy.
	self selection do: [ :aMonotoneSelection | toBeSelected deselect: aMonotoneSelection from to: aMonotoneSelection to ].

	toBeSelected do: [ :aMonotoneSelection |
		(aMonotoneSelection interval size > 1)
			ifTrue: [ self privateSelect: aMonotoneSelection from to: aMonotoneSelection to ] ].

	shouldUpdateCursor
		ifTrue: [ self updateCursors ]
]

{ #category : #private }
BrTextEditorSelecter >> updateCursors [
	| aNavigator |
	
	aNavigator := self editor navigator.
	aNavigator dueTo: self.
	aNavigator removeAll.
	self selection do: [ :aMonotoneSelection | aNavigator addAt: aMonotoneSelection to ].
	aNavigator apply
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> withoutCursorUpdate [
	shouldUpdateCursor := false
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> wordAt: aTextIndex [
	"Select a word or a whitespace at a given text index"
	| aWordInterval |
	self assertUIProcess.
	
	aWordInterval := self findWordAt: aTextIndex.
	self from: aWordInterval first to: aWordInterval last
]
