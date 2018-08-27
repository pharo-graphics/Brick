Class {
	#name : #BrRequest,
	#superclass : #BlEvent,
	#instVars : [
		'response'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrRequest >> defaultResponse [
	^ self subclassResponsibility
]

{ #category : #accessing }
BrRequest >> reply: anObject [
	response := self defaultResponse replied: anObject
]

{ #category : #accessing }
BrRequest >> response [
	^ response ifNil: [ response := self defaultResponse ]
]

{ #category : #accessing }
BrRequest >> response: anObject [
	response := anObject
]
