Class {
	#name : #BrTextReplacingAttributeWithCharacterStrategy,
	#superclass : #BrTextReplacingAttributeStrategy,
	#instVars : [
		'character'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextReplacingAttributeWithCharacterStrategy >> character [
	^ character
]

{ #category : #accessing }
BrTextReplacingAttributeWithCharacterStrategy >> character: anObject [
	character := anObject
]

{ #category : #initialization }
BrTextReplacingAttributeWithCharacterStrategy >> initialize [
	super initialize.
	
	character := $*
]

{ #category : #replacing }
BrTextReplacingAttributeWithCharacterStrategy >> swapString: aString [
	<return: #String>
	
	^ String new: aString size withAll: character
]
