Class {
	#name : #BrMaximizerElementEvent,
	#superclass : #BlEvent,
	#instVars : [
		'hostElement',
		'placeholderElement'
	],
	#category : #'Brick-Maximizer - Event'
}

{ #category : #accessing }
BrMaximizerElementEvent >> hostElement [
	^ hostElement
]

{ #category : #accessing }
BrMaximizerElementEvent >> hostElement: anObject [
	hostElement := anObject
]

{ #category : #accessing }
BrMaximizerElementEvent >> placeholderElement [
	^ placeholderElement
]

{ #category : #accessing }
BrMaximizerElementEvent >> placeholderElement: anObject [
	placeholderElement := anObject
]
