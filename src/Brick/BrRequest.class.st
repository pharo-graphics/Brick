Class {
	#name : #BrRequest,
	#superclass : #BlEvent,
	#instVars : [
		'response'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #testing }
BrRequest >> canRespond [
	"Not all requests support responses, return true if I am one of them"
	<return: #Boolean>

	^ self responseClass = BrNoResponse
]

{ #category : #initialization }
BrRequest >> initialize [
	super initialize.
	
	response := self responseClass new
]

{ #category : #accessing }
BrRequest >> response [
	^ response ifNil: [ response := self defaultResponse ]
]

{ #category : #accessing }
BrRequest >> response: anObject [
	response := anObject
]

{ #category : #initialization }
BrRequest >> responseClass [
	<return: #'BrResponse class'>

	^ BrNoResponse
]
