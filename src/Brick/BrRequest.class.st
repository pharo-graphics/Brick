Class {
	#name : #BrRequest,
	#superclass : #BlEvent,
	#instVars : [
		'response',
		'isOneWay'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrRequest class >> oneWay [
	^ self new oneWay
]

{ #category : #testing }
BrRequest >> canRespond [
	"Not all requests support responses, return true if I am one of them"
	<return: #Boolean>

	^ self responseClass = BrNoResponse
]

{ #category : #initialization }
BrRequest >> initialize [
	super initialize.
	
	response := self responseClass new.
	isOneWay := false.
	self canBePropagated: true
]

{ #category : #testing }
BrRequest >> isOneWay [
	^ isOneWay
]

{ #category : #accessing }
BrRequest >> oneWay [
	isOneWay := true
]

{ #category : #accessing }
BrRequest >> response [
	^ response
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

{ #category : #accessing }
BrRequest >> responseFor: aWidgetModel [
	^ self response
]
