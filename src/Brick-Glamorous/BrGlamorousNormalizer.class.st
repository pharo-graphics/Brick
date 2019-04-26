Class {
	#name : #BrGlamorousNormalizer,
	#superclass : #Object,
	#instVars : [
		'command'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #accessing }
BrGlamorousNormalizer >> command [
	
	^command
]

{ #category : #accessing }
BrGlamorousNormalizer >> command: aBlock [
	
	command := aBlock
]

{ #category : #accessing }
BrGlamorousNormalizer >> cull: anEntity [
	^ self value: anEntity
]

{ #category : #accessing }
BrGlamorousNormalizer >> value: anEntity [
	
	self subclassResponsibility
]
