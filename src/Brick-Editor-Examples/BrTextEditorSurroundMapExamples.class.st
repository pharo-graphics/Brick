Class {
	#name : #BrTextEditorSurroundMapExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSet [
	<gtExample>

	| definitions |

	definitions := 
		{ { $'. $'. [ :anOperator :anIndex | true ] }.
		{ $". $". [ :anOperator :anIndex | false ]}.
		{ $(. $). nil. }  } collect: 
			[ :each | 
				BrTextEditorSurroundDefinition new 
					openCharacter: each first;
					closeCharacter: each second;
					condition: each third ].
	^ BrTextEditorSurroundMap new
		addDefinitions: definitions.

]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetClosing [
	<gtExample>

	| opening |

	opening := self surroundSet
		openingFor: $' 
		ifPresent: [ :def | def ] 
		ifAbsent: [  ].
	self assert: opening equals: $'.
	^opening
]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetClosingAbsent [
	<gtExample>

	| definition |

	definition := self surroundSet
		openingFor: $x
		ifPresent: [ :def | def ] 
		ifAbsent: [ #absent ].
	self assert: definition equals: #absent.
	^definition
]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetOpeningAbsent [
	<gtExample>

	| definition |

	definition := self surroundSet
		closingFor: $x
		in: self at: 0 
		ifPresent: [ :def | def ] 
		ifAbsent: [ #absent ].
	self assert: definition equals: #absent.
	^definition
]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetOpeningConditionRejects [
	<gtExample>

	| definition |

	definition := self surroundSet
		closingFor: $"
		in: self at: 0
		ifPresent: [ :def | def ] 
		ifAbsent: [ #absent ].
	self assert: definition equals: #absent.
	^definition
]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetOpeningPresent [
	<gtExample>

	| closing |

	closing := self surroundSet
		closingFor: $' 
		in: self at: 0
		ifPresent: [ :def | def ] 
		ifAbsent: [  ].
	self assert: closing equals: $'.
	^closing
]
