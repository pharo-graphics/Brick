Class {
	#name : #BrToggleActivatedState,
	#superclass : #BrToggleState,
	#category : #'Brick-Toggle - States'
}

{ #category : #testing }
BrToggleActivatedState >> isActivated [
	^ true
]

{ #category : #printing }
BrToggleActivatedState >> printOn: aStream [
	aStream nextPutAll: 'activated'
]
