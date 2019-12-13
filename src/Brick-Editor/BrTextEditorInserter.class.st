"
Example:

[[[
anEditor := BrTextEditor new.
anEditor inserter
	atCursor;
	string: 'Hello';
	insert.
anEditor
]]]

"
Class {
	#name : #BrTextEditorInserter,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'insertionIndices',
		'text',
		'shouldUpdateCursor',
		'shouldUpdateSelection',
		'shouldDeleteSelected',
		'inputFilter',
		'withSurround',
		'rightSurroundText'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorInserter >> at: anIndex [
	"Add a given index as another text insertion location"

	(insertionIndices includes: anIndex)
		ifFalse: [ insertionIndices add: anIndex ]
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> atCursor [
	self cursor do: [ :aCursor | self at: aCursor position ]
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> atEnd [
	"Insert a text at the very end"
	self at: self text size
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> beforeSelectedLines [
	"We insert text at the beginning of all selected lines"
	| aCollectionOfLineStarts |
	
	aCollectionOfLineStarts := OrderedCollection new.
	
	self selection do: [ :aMonotoneSelection |
		aCollectionOfLineStarts add: (self findLineStartBefore: aMonotoneSelection from + 1).
		aCollectionOfLineStarts addAll: (self findLineStartsBetween: aMonotoneSelection from + 1 and: aMonotoneSelection to) ].

	aCollectionOfLineStarts asSet do: [ :anIndex | self at: anIndex ]
]

{ #category : #private }
BrTextEditorInserter >> computeIndexMovement: anIndex afterInserted: aText at: anInsertionIndex [
	"Compute by how much a given text index should be moved after a privided text is inserted at a given insertion index"
	<return: #Number>

	^ anIndex < anInsertionIndex
		ifTrue: [ 0 ]
		ifFalse: [ aText size ]
]

{ #category : #private }
BrTextEditorInserter >> computeSelection: aSelection afterInserted: aText at: anInsertionIndex [
	<return: #BlSelection>

	aSelection to <= anInsertionIndex
		ifTrue: [ ^ aSelection ].

	aSelection from >= anInsertionIndex
		ifTrue: [ ^ BlSelection
			from: aSelection from + aText size
			to: aSelection to + aText size ].

	^ BlSelection
		from: aSelection from
		to: aSelection to + aText size
]

{ #category : #private }
BrTextEditorInserter >> deleteSelectedText [
	| aDeleter newInsertionIndices |
	
	aDeleter := self editor deleter.
	aDeleter selected.

	newInsertionIndices := SortedCollection new.
	insertionIndices do: [ :anIndex |
		newInsertionIndices add: (anIndex + (aDeleter computeIndexMovement: anIndex)) ].
	
	insertionIndices := newInsertionIndices.
	
	aDeleter delete
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> indentation [
	"Insert an indentation (Tab)"

	text := String tab
]

{ #category : #initialization }
BrTextEditorInserter >> initialize [
	super initialize.
	
	text := nil.
	
	"a text that should be added on the right side when surround insertion is enabled.
	if surround text is not set, we duplicate the inserted text itself"
	rightSurroundText := nil.
	
	insertionIndices := SortedCollection new.
	shouldUpdateCursor := true.
	shouldUpdateSelection := true.
	shouldDeleteSelected := true.
	
	withSurround := false.	
	inputFilter := BrTextEditorNoInputfilter new
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> inputFilter: aTextEditorInputFilter [
	inputFilter := aTextEditorInputFilter
]

{ #category : #'api - processing' }
BrTextEditorInserter >> insert [
	| aFilteredText aRightSurroundText |
	
	aFilteredText := inputFilter filter: text.
	aFilteredText isEmpty
		ifTrue: [ ^ self ].
	
	aRightSurroundText := withSurround
		ifTrue: [ rightSurroundText
			ifNil: [ aFilteredText ]
			ifNotNil: [ inputFilter filter: rightSurroundText ] ]
		ifFalse: [ aFilteredText ].

	shouldDeleteSelected
		ifTrue: [ self deleteSelectedText ].
		
	insertionIndices reverseDo: [ :anIndex |
		withSurround
			ifTrue: [ self
				privateInsertString: aFilteredText
				withSurround: aRightSurroundText
				at: anIndex ]
			ifFalse: [ self privateInsertString: aFilteredText at: anIndex ].

		shouldUpdateCursor
			ifTrue: [
				withSurround
					ifTrue: [ self privateUpdateCursorsAfterInsertion: aFilteredText withSurround: aRightSurroundText at: anIndex ]
					ifFalse: [ self privateUpdateCursorsAfterInsertion: aFilteredText at: anIndex ] ].
		shouldUpdateSelection
			ifTrue: [
				withSurround
					ifTrue: [ self updateSelectionAfterInsertion: aFilteredText withSurround: aRightSurroundText at: anIndex ]
					ifFalse: [ self updateSelectionAfterInsertion: aFilteredText at: anIndex ] ] ]
]

{ #category : #testing }
BrTextEditorInserter >> isInserter [
	^ true
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> lineEnding [
	"Insert a line ending (Cr, Lf or CrLf depending on the current platform)"

	text := OSPlatform current lineEnding
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> lineEndingWithWhitespace [
	"Insert a line ending (Cr, Lf or CrLf depending on the current platform)
	additionally  adding a whitespace from the previous line according to a cursor"

	text := self cursor isEmpty
		ifTrue: [ OSPlatform current lineEnding ]
		ifFalse: [ OSPlatform current lineEnding, (self findWhitespaceOfLineBefore: self cursor first position) ]
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> onlyAlphaNumeric [
	self inputFilter: BrTextEditorAlphaNumericInputFilter new
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> onlyDigits [
	self inputFilter: BrTextEditorDigitInputFilter new
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> onlyLetters [
	self inputFilter: BrTextEditorLetterInputFilter new
]

{ #category : #private }
BrTextEditorInserter >> privateComputeInsertionIndices: aString withSurround: aSurroundString at: aTextIndex [
	| aLeftIndex aRightIndex |

	aLeftIndex := aTextIndex.
	aRightIndex := aTextIndex + aString size.
	
	(self selection do: [ :eachMonotoneSelection | (eachMonotoneSelection contains: aTextIndex)
		ifTrue: [
			aLeftIndex := eachMonotoneSelection from.
			aRightIndex := eachMonotoneSelection to + aString size ] ]).
	
	^ { aLeftIndex . aRightIndex }
]

{ #category : #private }
BrTextEditorInserter >> privateInsertString: aString at: aTextIndex [
	| aCommand |

	aCommand := BrTextEditorInsertStringCommand new
		string: aString;
		index: aTextIndex.
	self editor enqueueCommand: aCommand
]

{ #category : #private }
BrTextEditorInserter >> privateInsertString: aString withSurround: aRightSurroundText at: aTextIndex [
	| aCommand theIndices |

	theIndices := self privateComputeInsertionIndices: aString withSurround: aRightSurroundText at: aTextIndex.

	aCommand := BrTextEditorInsertStringCommand new
		string: aString;
		index: theIndices first.
	self editor enqueueCommand: aCommand.
	
	aCommand := BrTextEditorInsertStringCommand new
		string: aRightSurroundText;
		index: theIndices second.
	
	self editor enqueueCommand: aCommand
]

{ #category : #private }
BrTextEditorInserter >> privateUpdateCursorsAfterInsertion: aText at: anIndex [
	self cursor do: [ :aCursor |
		| aCursorDelta |
		aCursorDelta := self
			computeIndexMovement: aCursor position
			afterInserted: aText
			at: anIndex.

		aCursorDelta isZero
			ifFalse: [ self editor navigator
				dueTo: self;
				move: aCursor by: aCursorDelta;
				apply ] ]
]

{ #category : #private }
BrTextEditorInserter >> privateUpdateCursorsAfterInsertion: aText withSurround: aSurroundText at: aTextIndex [
	| theIndices |

	theIndices := self privateComputeInsertionIndices: aText withSurround: aSurroundText at: aTextIndex.

	self cursor do: [ :aCursor |
		| aCursorDelta |
					
		aCursorDelta := self
			computeIndexMovement: aCursor position
			afterInserted: aText
			at: theIndices first.
	
		aCursorDelta := aCursorDelta + (self
			computeIndexMovement: aCursor position
			afterInserted: aSurroundText
			at: theIndices second + aText size).

		aCursorDelta isZero
			ifFalse: [ self editor navigator
				dueTo: self;
				move: aCursor by: aCursorDelta;
				apply ] ]
]

{ #category : #'private - accessing' }
BrTextEditorInserter >> shouldDeleteSelected [
	^ shouldDeleteSelected
]

{ #category : #'private - accessing' }
BrTextEditorInserter >> shouldDeleteSelected: aBoolean [
	shouldDeleteSelected := aBoolean
]

{ #category : #'private - accessing' }
BrTextEditorInserter >> shouldUpdateCursor [
	^ shouldUpdateCursor
]

{ #category : #'private - accessing' }
BrTextEditorInserter >> shouldUpdateCursor: anObject [
	shouldUpdateCursor := anObject
]

{ #category : #'private - accessing' }
BrTextEditorInserter >> shouldUpdateSelection [
	^ shouldUpdateSelection
]

{ #category : #'private - accessing' }
BrTextEditorInserter >> shouldUpdateSelection: anObject [
	shouldUpdateSelection := anObject
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> string: aString [
	text := aString
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> text: aBlText [
	text := aBlText
]

{ #category : #private }
BrTextEditorInserter >> updateSelectionAfterInsertion: aText at: anIndex [
	| anExistingSelection |

	anExistingSelection := BlCompositeSelection new select: self editor selection.
	anExistingSelection reverseDo: [ :aMonotoneSelection |
		| aNewSelection |

		aNewSelection := self computeSelection: aMonotoneSelection afterInserted: aText at: anIndex.
		aNewSelection = aMonotoneSelection
			ifFalse: [
				self editor deselect: aMonotoneSelection from to: aMonotoneSelection to.
				self editor select: aNewSelection from to: aNewSelection to ] ]
]

{ #category : #private }
BrTextEditorInserter >> updateSelectionAfterInsertion: aText withSurround: aSurroundText at: aTextIndex [
	| anExistingSelection theIndices |
	
	theIndices := self privateComputeInsertionIndices: aText withSurround: aSurroundText at: aTextIndex.

	anExistingSelection := BlCompositeSelection new select: self editor selection.
	anExistingSelection reverseDo: [ :aMonotoneSelection |
		| aNewSelection |

		aNewSelection := self computeSelection: aMonotoneSelection afterInserted: aText at: theIndices first.
		aNewSelection := self computeSelection: aNewSelection afterInserted: aText at: theIndices second.
		aNewSelection = aMonotoneSelection
			ifFalse: [
				self editor deselect: aMonotoneSelection from to: aMonotoneSelection to.
				self editor select: aNewSelection from to: aNewSelection to ] ]
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> withSelectionDelete [
	shouldDeleteSelected := true
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> withSurround [
	"When inserting a text it should be duplicated surrounding a cursor or a selection"
	
	withSurround := true.
	rightSurroundText := nil.
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> withSurround: aRightSurroundTextOrString [
	"When inserting a text it should be duplicated surrounding a cursor or a selection"
	
	self withSurround.
	rightSurroundText := aRightSurroundTextOrString
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> withoutCursorUpdate [
	shouldUpdateCursor := false
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> withoutSelectionDelete [
	shouldDeleteSelected := false
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> withoutSelectionUpdate [
	shouldUpdateSelection := false
]
