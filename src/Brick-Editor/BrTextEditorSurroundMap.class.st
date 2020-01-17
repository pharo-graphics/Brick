"
BrTextEditorSurroundSet provides dictionary like lookup for opening and closing surround characters.

See BrTextEditorSurroundDefinition for more information. 

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	definitions:		<Array>


!!!Implementation Points

The size of the collection is assumed to be small, so a simple search is done instead of using a Dictionary.
"
Class {
	#name : #BrTextEditorSurroundMap,
	#superclass : #Object,
	#instVars : [
		'definitions'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #adding }
BrTextEditorSurroundMap >> addDefinition: aBrTextEditorSurroundDefinition [

	definitions := definitions copyWith: aBrTextEditorSurroundDefinition
]

{ #category : #adding }
BrTextEditorSurroundMap >> addDefinitions: anArray [

	definitions := definitions, anArray
]

{ #category : #accessing }
BrTextEditorSurroundMap >> associations [
	"Answer an array of openCharacter -> closeCharacter associations"

	^definitions collect: [ :definition |
		definition openCharacter -> definition closeCharacter ]
]

{ #category : #accessing }
BrTextEditorSurroundMap >> closingAt: aCharacter ifPresent: presentBlock ifAbsent: absentBlock [

	| definition |

	definition := definitions
		detect: [ :each | each closeCharacter = aCharacter ]
		ifNone: [ ^absentBlock value ].
	^presentBlock value: definition openCharacter.
]

{ #category : #initialization }
BrTextEditorSurroundMap >> initialize [ 

	super initialize.
	definitions := #().
]

{ #category : #accessing }
BrTextEditorSurroundMap >> openingAt: aCharacter ifPresent: presentBlock ifAbsent: absentBlock [

	| definition |

	definition := definitions
		detect: [ :each | each openCharacter = aCharacter ]
		ifNone: [ ^absentBlock value ].
	^presentBlock value: definition closeCharacter.
]

{ #category : #accessing }
BrTextEditorSurroundMap >> openingAt: aCharacter in: anOperator at: anIndex ifPresent: presentBlock ifAbsent: absentBlock [

	| definition |

	definition := definitions
		detect: [ :each | each openCharacter = aCharacter ]
		ifNone: [ ^absentBlock value ].
	definition condition ifNotNil: [ :condition |
		(condition value: anOperator value: anIndex) ifFalse: 
			[ ^absentBlock value ] ].
	^presentBlock value: definition closeCharacter.
]
