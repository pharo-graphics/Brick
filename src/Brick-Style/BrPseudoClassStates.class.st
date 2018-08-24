Class {
	#name : #BrPseudoClassStates,
	#superclass : #OrderedCollection,
	#instVars : [
		'styleable'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #'as yet unclassified' }
BrPseudoClassStates class >> on: aStyleable [
	^ self new
		styleable: aStyleable;
		yourself
]

{ #category : #accessing }
BrPseudoClassStates >> styleable [
	^ styleable
]

{ #category : #accessing }
BrPseudoClassStates >> styleable: anObject [
	styleable := anObject
]
