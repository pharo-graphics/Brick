Class {
	#name : #BrIdentityNormalizer,
	#superclass : #BrGlamorousNormalizer,
	#instVars : [
		'dictionary',
		'colorIndex'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #'instance creation' }
BrIdentityNormalizer class >> startingWithBlue [
	^ self new
			setIndexTo: Color blue;
			yourself
]

{ #category : #'instance creation' }
BrIdentityNormalizer class >> startingWithRed [
	^ self new
			setIndexTo: Color red;
			yourself
]

{ #category : #'instance creation' }
BrIdentityNormalizer class >> withCommand: aBlock [
	
	^(self new)
		command: aBlock;
		yourself
]

{ #category : #'initialize-release' }
BrIdentityNormalizer >> colors [
	^ BrGlamorousColors distinctTenStrongColors
]

{ #category : #'initialize-release' }
BrIdentityNormalizer >> initialize [
	
	super initialize.
	colorIndex := 0.
	dictionary := Dictionary new.
	command := #yourself
]

{ #category : #private }
BrIdentityNormalizer >> nextColor [
	
	colorIndex := colorIndex \\ self colors size + 1.
	^self colors at: colorIndex
]

{ #category : #private }
BrIdentityNormalizer >> setIndexTo: aColor [
	"colorAsSymbol has to be one of Color colorNames. 
	The method set the current index to the color given in parameter"
	
	colorIndex := (self colors indexOf: aColor) - 1
]

{ #category : #accessing }
BrIdentityNormalizer >> value: anEntity [
	
	^ dictionary
		at: (command cull: anEntity)
		ifAbsentPut: [ self nextColor ]
]
