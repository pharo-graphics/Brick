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

{ #category : #private }
BrTextEditorSelecter >> characterType: aCharacter [
	<return: #Symbol>
	
	(self isWordChar: aCharacter)
		ifTrue: [ ^ #word ].
		
	aCharacter isSeparator
		ifTrue: [ ^ #separator ].
		
	^ #other
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> extendToLineEnd [
	"Extend selection to the end of the line"
	| theNewCursorPositions theNewSelections |
	self assertUIProcess.

	theNewCursorPositions := (self cursors collect: [ :aCursor |
		aCursor -> ((self findTextIndexAtLineStart: aCursor) to: (self findTextIndexAtLineEnd: aCursor)) ]) as: OrderedIdentityDictionary.

	theNewCursorPositions := (theNewCursorPositions associations select: [ :eachAssoc |
		| eachExistingCursor eachLineInterval |
		eachExistingCursor := eachAssoc key.
		eachLineInterval := eachAssoc value.
		eachExistingCursor position ~= eachLineInterval last
	]) as: OrderedIdentityDictionary.

	theNewSelections := theNewCursorPositions associations collect: [ :eachAssoc |
		| eachExistingCursor eachLineInterval aStartIndex |
		eachExistingCursor := eachAssoc key.
		eachLineInterval := eachAssoc value.
		aStartIndex := self findLineSelectionEndAfter: eachExistingCursor within: eachLineInterval.
		BlMonotoneSelection from: aStartIndex to: eachLineInterval last ].

	theNewCursorPositions do: [ :eachLineInterval |
		self editor deselecter
			from: eachLineInterval first to: eachLineInterval last;
			deselect ].

	theNewSelections do: [ :eachSelection |
		self from: eachSelection from to: eachSelection to ]
]

{ #category : #private }
BrTextEditorSelecter >> findLineSelectionEndAfter: aCursor within: aTextInterval [
	| anEndIndex |
	
	anEndIndex := aCursor position.
	self selection do: [ :eachMonotoneSelection |
		(eachMonotoneSelection to between: aTextInterval first and: aTextInterval last)
			ifTrue: [ anEndIndex := anEndIndex max: eachMonotoneSelection to ].
	
		(eachMonotoneSelection to > aTextInterval last
			and: [ eachMonotoneSelection from <= aTextInterval last ])
				ifTrue: [ anEndIndex := aTextInterval last ] ].

	^ anEndIndex
]

{ #category : #private }
BrTextEditorSelecter >> findLineSelectionStartBefore: aCursor within: aTextInterval [
	| aStartIndex |
	
	aStartIndex := aCursor position.
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

{ #category : #private }
BrTextEditorSelecter >> isWordChar: aCharacter [
	<return: #Number>

	^ aCharacter isAlphaNumeric
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
	| theCursorsOnTheLeft theCursorsOnTheRight theCursorsOutside |
	self assertUIProcess.
	
	theCursorsOnTheLeft := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection from ] ].
		
	theCursorsOnTheRight := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection to ] ].
	
	theCursorsOutside := self cursors
		select: [ :aCursor | (self selection anySatisfy: [ :aSelection | aCursor position between: aSelection from and: aSelection to ]) not ].
		
	"the cursor is on the right side of the selection, we should deselect right most character"
	theCursorsOnTheRight do: [ :aCursor |
		self editor deselecter
			from: aCursor position - 1 to: aCursor position;
			deselect ].
	
	"the cursor is on the left side of the selection or is not inside any selection, we should extend it by one character to the left"
	theCursorsOnTheLeft, theCursorsOutside do: [ :aCursor | 
		self from: ((aCursor position - 1) max: 0) to: aCursor position ].
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> moveOneToRight [
	"Select and move a cursor one character to the right"
	| theCursorsOnTheLeft theCursorsOnTheRight theCursorsOutside |
	self assertUIProcess.
	
	theCursorsOnTheLeft := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection from ] ].
		
	theCursorsOnTheRight := self cursors
		select: [ :aCursor | self selection anySatisfy: [ :aSelection | aCursor position = aSelection to ] ].
	
	theCursorsOutside := self cursors
		select: [ :aCursor | (self selection anySatisfy: [ :aSelection | aCursor position between: aSelection from and: aSelection to ]) not ].
		
	"the cursor is on the left side of the selection, we should deselect left most character"
	theCursorsOnTheLeft do: [ :aCursor |
		self editor deselecter
			from: aCursor position to: aCursor position + 1;
			deselect ].
	
	"the cursor is on the right side of the selection or is not inside any selection, we should extend it by one character to the right"
	theCursorsOnTheRight, theCursorsOutside do: [ :aCursor | 
		self from: aCursor position to: ((aCursor position + 1) min: self text size) ].
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
BrTextEditorSelecter >> moveToLineStart [
	"Extend selection to the start of the line"
	| theNewCursorPositions theNewSelections |
	self assertUIProcess.

	theNewCursorPositions := (self cursors collect: [ :aCursor |
		aCursor -> ((self findTextIndexAtLineStart: aCursor) to: (self findTextIndexAtLineEnd: aCursor)) ]) as: OrderedIdentityDictionary.

	theNewCursorPositions := (theNewCursorPositions associations select: [ :eachAssoc |
		| eachExistingCursor eachLineInterval |
		eachExistingCursor := eachAssoc key.
		eachLineInterval := eachAssoc value.
		eachExistingCursor position ~= eachLineInterval first
	]) as: OrderedIdentityDictionary.

	theNewSelections := theNewCursorPositions associations collect: [ :eachAssoc |
		| eachExistingCursor eachLineInterval anEndIndex |
		eachExistingCursor := eachAssoc key.
		eachLineInterval := eachAssoc value.
		anEndIndex := self findLineSelectionStartBefore: eachExistingCursor within: eachLineInterval.
		BlMonotoneSelection from: eachLineInterval first to: anEndIndex ].

	theNewCursorPositions do: [ :eachLineInterval |
		self editor deselecter
			from: eachLineInterval first to: eachLineInterval last;
			deselect ].

	theNewSelections do: [ :eachSelection |
		self from: eachSelection from to: eachSelection to ]
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
	| aTextIterator hasWordToTheLeft hasWordToTheRight shouldBeWord aWordStart aWordEnd aDesiredType |
	self assertUIProcess.
	
	aTextIterator := self text iterator skip: aTextIndex.
	
	hasWordToTheLeft := aTextIterator hasPrevious and: [ self isWordChar: aTextIterator peer ].
	hasWordToTheRight := aTextIterator hasNext and: [ self isWordChar: aTextIterator peek ].
	shouldBeWord := hasWordToTheLeft or: hasWordToTheRight.
	
	aWordStart := aTextIndex.
	aWordEnd := aTextIndex.
	
	aTextIterator hasNext ifTrue: [
		aTextIterator
			nextSegment: [ :eachCharacter | self characterType: eachCharacter ]
			indicesDo: [ :aStart :anEnd :aType |
				aDesiredType := aType.
				(shouldBeWord not or: [ (aType = #word and: [ shouldBeWord ]) ])
					ifTrue: [ aWordEnd := anEnd ] ] ].
	
	aTextIterator := self text iterator skip: aTextIndex.
	aTextIterator hasPrevious ifTrue: [
		aTextIterator
			previousSegment: [ :eachCharacter | self characterType: eachCharacter ]
			indicesDo: [ :aStart :anEnd :aType |
				((aType = #word and: [ shouldBeWord ]) or: [ (aDesiredType isNil or: [ aType = aDesiredType ] ) ])
					ifTrue: [ aWordStart := aStart ] ] ].
			
	self from: aWordStart to: aWordEnd
]
