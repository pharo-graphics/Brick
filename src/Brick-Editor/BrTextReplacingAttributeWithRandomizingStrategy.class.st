Class {
	#name : #BrTextReplacingAttributeWithRandomizingStrategy,
	#superclass : #BrTextReplacingAttributeStrategy,
	#instVars : [
		'special'
	],
	#category : #'Brick-Editor-Attributes - Support'
}

{ #category : #initialization }
BrTextReplacingAttributeWithRandomizingStrategy >> initialize [
	super initialize.
	
	special := ('-/\*~<>=,%|&?!' , (String
		   with: Character centeredDot
		   with: Character divide
		   with: Character plusOrMinus
		   with: Character times))
]

{ #category : #replacing }
BrTextReplacingAttributeWithRandomizingStrategy >> replaceCharacter: aCharacter [

	aCharacter isDigit
		ifTrue: [ ^ ($0 to: $9) atRandom ].
		
	aCharacter isLetter
		ifTrue: [ ^ aCharacter isUppercase
			ifTrue: [ ($A to: $Z) atRandom ]
			ifFalse: [ ($a to: $z) atRandom ] ].
		
	(self special includes: aCharacter)
		ifTrue: [ ^ self special atRandom ].

	^ aCharacter
]

{ #category : #accessing }
BrTextReplacingAttributeWithRandomizingStrategy >> special [
	^ special
]

{ #category : #accessing }
BrTextReplacingAttributeWithRandomizingStrategy >> special: anObject [
	special := anObject
]

{ #category : #replacing }
BrTextReplacingAttributeWithRandomizingStrategy >> swapString: aString [
	<return: #String>
	
	^ aString collect: [ :eachCharacter | self replaceCharacter: eachCharacter ]
]
