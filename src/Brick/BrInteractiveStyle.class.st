Class {
	#name : #BrInteractiveStyle,
	#superclass : #Object,
	#instVars : [
		'state',
		'action'
	],
	#category : #'Brick-! Core - Support'
}

{ #category : #accessing }
BrInteractiveStyle >> action [
	<return: #BlockClosure>

	^ action
]

{ #category : #accessing }
BrInteractiveStyle >> action: aValuable [
	action := aValuable
]

{ #category : #printing }
BrInteractiveStyle >> printOn: aStream [
	aStream
		nextPutAll: 'when: ';
		print: self state;
		nextPutAll: ' style: ';
		print: self action
]

{ #category : #accessing }
BrInteractiveStyle >> state [
	<return: #BrInteractionState>

	^ state
]

{ #category : #accessing }
BrInteractiveStyle >> state: anInteractionState [
	state := anInteractionState
]
