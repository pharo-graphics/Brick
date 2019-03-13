Class {
	#name : #BrExplicitIdentityNormalizer,
	#superclass : #BrIdentityNormalizer,
	#instVars : [
		'colors',
		'defaultColor'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #'instance creation' }
BrExplicitIdentityNormalizer class >> withCommand: aBlock withColors: aCollection withDefaultColor: aColor [
	
	^(self withCommand: aBlock)
		colors: aCollection;
		defaultColor: aColor;
		yourself
]

{ #category : #accessing }
BrExplicitIdentityNormalizer >> colors [
	
	^colors
]

{ #category : #accessing }
BrExplicitIdentityNormalizer >> colors: anObject [
	
	colors := anObject
]

{ #category : #accessing }
BrExplicitIdentityNormalizer >> defaultColor [
	
	^defaultColor
]

{ #category : #accessing }
BrExplicitIdentityNormalizer >> defaultColor: anObject [
	
	defaultColor := anObject
]

{ #category : #private }
BrExplicitIdentityNormalizer >> nextColor [
	
	colorIndex := colorIndex + 1.
	^colorIndex > self colors size
		ifTrue: [ self defaultColor ]
		ifFalse: [ self colors at: colorIndex ]
]
