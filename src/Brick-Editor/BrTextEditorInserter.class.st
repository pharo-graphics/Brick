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
		'surroundMap'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorInserter >> at: anIndex [
	"Add a given index as another text insertion location"

	insertionIndices
		detect: [ :eachAssociation | eachAssociation key = anIndex ]
		ifNone: [ insertionIndices add: (anIndex -> text) ]
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
	insertionIndices do: [ :eachAssociation |
		| anIndex |
		anIndex := eachAssociation key.
		newInsertionIndices add: (anIndex + (aDeleter computeIndexMovement: anIndex)) -> eachAssociation value ].
	
	insertionIndices := newInsertionIndices.
	
	aDeleter delete
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> indentation [
	"Insert an indentation (Tab)"

	self text: String tab
]

{ #category : #initialization }
BrTextEditorInserter >> initialize [
	super initialize.
	
	text := nil.
	
	"a text that should be added on the right side when surround insertion is enabled.
	if surround text is not set, we duplicate the inserted text itself"
	surroundMap := BrTextEditorSurroundMap new.
	
	insertionIndices := SortedCollection sortBlock: [ :a :b | a key < b key ].
	shouldUpdateCursor := true.
	shouldUpdateSelection := true.
	shouldDeleteSelected := true.

	inputFilter := BrTextEditorNoInputfilter new
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> inputFilter: aTextEditorInputFilter [
	inputFilter := aTextEditorInputFilter
]

{ #category : #'api - processing' }
BrTextEditorInserter >> insert [
	| theFilteredTextMap theInsertions theCursorMovements |

	shouldDeleteSelected
		ifTrue: [ self deleteSelectedText ].
		
	theFilteredTextMap := Dictionary new.
	theInsertions := OrderedCollection new.
	theCursorMovements := OrderedCollection new.

	insertionIndices do: [ :eachAssociation |
		| anIndex aFilteredText |
		
		anIndex := eachAssociation key.
		
		aFilteredText := theFilteredTextMap
			at: eachAssociation value
			ifAbsentPut: [ inputFilter filter: eachAssociation value ].

		surroundMap
			closingFor: eachAssociation value
			in: self at: anIndex
			ifPresent: [ :aRightSurroundText |
				| aFilteredSurroundText theSurroundingIndices |
				aFilteredSurroundText := theFilteredTextMap
					at: aRightSurroundText
					ifAbsentPut: [ inputFilter filter: aRightSurroundText ].

				theSurroundingIndices := self
					privateComputeInsertionIndices: aFilteredText
					withSurround: aFilteredSurroundText
					at: anIndex.
					
				theInsertions add: { 
					#index -> theSurroundingIndices first.
					#string -> aFilteredText.
					#requestedIndex -> anIndex.
					#surrounding -> {
						#index -> theSurroundingIndices second.
						#string -> aRightSurroundText.
					} asDictionary
				} asDictionary ]

			ifAbsent: [
				surroundMap
					openingFor: eachAssociation value
					ifPresent: [ :aLeftSurroundText |
						(self hasString: eachAssociation value afterCursor: (BrTextEditorSingleCursor at: anIndex))
							ifTrue: [
								shouldUpdateCursor
									ifTrue: [
										self cursors do: [ :eachCursor |
											(eachCursor position = anIndex) ifTrue: [ theCursorMovements add: (eachCursor -> (anIndex + eachAssociation value size)) ] ] ]]
							ifFalse: [
								theInsertions add: { 
									#index -> anIndex.
									#requestedIndex -> anIndex.
									#string -> aFilteredText.
								} asDictionary
					] ]
					ifAbsent: [
						theInsertions add: { 
							#index -> anIndex.
							#requestedIndex -> anIndex.
							#string -> aFilteredText.
						} asDictionary
					] ] ].
		
	theInsertions in: [ :_ |
		| theInsertionStrings theInsertionIndices |
		
		theInsertionStrings := OrderedCollection new.
		theInsertionIndices := OrderedCollection new.
		
		theInsertions do: [ :eachInsertion |
			theInsertionStrings add: (eachInsertion at: #string).
			theInsertionIndices add: (eachInsertion at: #index).
			eachInsertion at: #surrounding
					ifPresent: [ :aSurrounding |
						theInsertionStrings add: (aSurrounding at: #string).
						theInsertionIndices add: (aSurrounding at: #index) ] ].

		self editor history groupDuring: [
			theCursorMovements ifNotEmpty: [ :theMovements |
				| aNavigator |
				aNavigator := self editor navigator.
				aNavigator withHistorization.
				theMovements do: [ :eachMovement | aNavigator move: eachMovement key to: eachMovement value ].
				aNavigator apply ].
			self privateInsertStrings: theInsertionStrings atAll: theInsertionIndices ] ].	
	
	theInsertions reverseDo: [ :eachInsertion | 
		shouldUpdateCursor
			ifTrue: [
				eachInsertion at: #surrounding
					ifPresent: [ :aSurrounding |
						self
							privateUpdateCursorsAfterInsertion: (eachInsertion at: #string)
							withSurround: (aSurrounding at: #string)
							at: (eachInsertion at: #requestedIndex) ]
					ifAbsent: [
						self
							privateUpdateCursorsAfterInsertion: (eachInsertion at: #string)
							at: (eachInsertion at: #requestedIndex) ] ].
		shouldUpdateSelection
			ifTrue: [
				eachInsertion at: #surrounding
					ifPresent: [ :aSurrounding |
						self
							updateSelectionAfterInsertion: (eachInsertion at: #string)
							withSurround: (aSurrounding at: #string)
							at: (eachInsertion at: #requestedIndex) ]
					ifAbsent: [
						self
							updateSelectionAfterInsertion: (eachInsertion at: #string)
							at: (eachInsertion at: #requestedIndex) ] ] ]
]

{ #category : #testing }
BrTextEditorInserter >> isInserter [
	^ true
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> lineEnding [
	"Insert a line ending (Cr, Lf or CrLf depending on the current platform)"

	self text: OSPlatform current lineEnding
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> lineEndingWithWhitespace [
	"Insert a line ending (Cr, Lf or CrLf depending on the current platform)
	additionally  adding a whitespace from the previous line according to a cursor"

	self text: (self cursor isEmpty
		ifTrue: [ OSPlatform current lineEnding ]
		ifFalse: [ OSPlatform current lineEnding, (self findWhitespaceOfLineBefore: self cursor first position) ])
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
BrTextEditorInserter >> privateComputeCursorIndices: aString withSurround: aSurroundString at: aTextIndex [
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
BrTextEditorInserter >> privateComputeInsertionIndices: aString withSurround: aSurroundString at: aTextIndex [
	| aLeftIndex aRightIndex |

	aLeftIndex := aTextIndex.
	aRightIndex := aTextIndex.
	
	(self selection do: [ :eachMonotoneSelection | (eachMonotoneSelection contains: aTextIndex)
		ifTrue: [
			aLeftIndex := eachMonotoneSelection from.
			aRightIndex := eachMonotoneSelection to ] ]).
	
	^ { aLeftIndex . aRightIndex }
]

{ #category : #private }
BrTextEditorInserter >> privateComputeSelectionIndices: aString withSurround: aSurroundString at: aTextIndex [
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
BrTextEditorInserter >> privateInsertStrings: aCollectionOfString atAll: aCollectionOfIndices [
	| aCommand |

	aCommand := BrTextEditorInsertStringsCommand new
		strings: aCollectionOfString;
		indices: aCollectionOfIndices.

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

	theIndices := self privateComputeCursorIndices: aText withSurround: aSurroundText at: aTextIndex.

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
	self text: aString
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> surroundings: aSurroundMap [
	surroundMap := aSurroundMap
]

{ #category : #'api - configuration' }
BrTextEditorInserter >> text: aBlText [
	text := aBlText.
	insertionIndices do: [ :eachAssociation | eachAssociation value ifNil: [ eachAssociation value: text ] ]
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
	
	theIndices := self privateComputeSelectionIndices: aText withSurround: aSurroundText at: aTextIndex.

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
