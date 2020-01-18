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

{ #category : #'instance creation' }
BrTextEditorSurroundMap class >> newFromArray: anArrayOfArray [
	^ self newFromArrays: { anArrayOfArray }
]

{ #category : #'instance creation' }
BrTextEditorSurroundMap class >> newFromArrays: anArrayOfArray [
	"When inserting some special symbols a text editor should surround a cursor or selection with that symbol
	anArrayOfArray is:
		{ { <left-character>. <right-character> <condition> } { ... } ... }
	<condition> is:
		[ :anOperator :anIndex | anOperator hasSpaceAroundIndex: anIndex ]"
	| theDefinitions |
	theDefinitions := anArrayOfArray collect: [ :each |
			BrTextEditorSurroundDefinition new 
					openCharacter: each first;
					closeCharacter: each second;
					condition: each third ].
	^ self new addDefinitions: theDefinitions.
]

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
BrTextEditorSurroundMap >> closingFor: aCharacter ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the matching closing character for the supplied opening character"
	| definition |

	definition := definitions
		detect: [ :each | each openCharacter = aCharacter ]
		ifNone: [ ^absentBlock value ].
	^presentBlock value: definition closeCharacter.
]

{ #category : #accessing }
BrTextEditorSurroundMap >> closingFor: aCharacter in: anOperator at: anIndex ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the matching closing character for the supplied opening character.
	If the receiver has a condition block that evaluates to false, execute the absentBlock."
	| definition |

	definition := definitions
		detect: [ :each | each openCharacter = aCharacter ]
		ifNone: [ ^absentBlock value ].
	definition condition ifNotNil: [ :condition |
		(condition value: anOperator value: anIndex) ifFalse: 
			[ ^absentBlock value ] ].
	^presentBlock value: definition closeCharacter.
]

{ #category : #initialization }
BrTextEditorSurroundMap >> initialize [ 

	super initialize.
	definitions := #().
]

{ #category : #accessing }
BrTextEditorSurroundMap >> openingFor: aCharacter ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the matching opening character for the supplied closing character"
	| definition |

	definition := definitions
		detect: [ :each | each closeCharacter = aCharacter ]
		ifNone: [ ^absentBlock value ].
	^presentBlock value: definition openCharacter.
]
