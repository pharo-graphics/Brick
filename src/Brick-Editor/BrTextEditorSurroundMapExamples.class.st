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

	| definition |

	definition := self surroundSet
		closingAt: $' 
		ifPresent: [ :def | def ] 
		ifAbsent: [  ].
	self assert: definition class equals: BrTextEditorSurroundDefinition.
	self assert: definition closeCharacter equals: $'.
	^definition
]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetClosingAbsent [
	<gtExample>

	| definition |

	definition := self surroundSet
		closingAt: $x
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
		openingAt: $x
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
		openingAt: $"
		in: self at: 0
		ifPresent: [ :def | def ] 
		ifAbsent: [ #absent ].
	self assert: definition equals: #absent.
	^definition
]

{ #category : #examples }
BrTextEditorSurroundMapExamples >> surroundSetOpeningPresent [
	<gtExample>

	| definition |

	definition := self surroundSet
		openingAt: $' 
		in: self at: 0
		ifPresent: [ :def | def ] 
		ifAbsent: [  ].
	self assert: definition class equals: BrTextEditorSurroundDefinition.
	self assert: definition openCharacter equals: $'.
	^definition
]
