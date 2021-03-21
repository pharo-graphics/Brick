Class {
	#name : #BrToggleDeactivatedState,
	#superclass : #BrToggleState,
	#category : #'Brick-Toggle - States'
}

{ #category : #testing }
BrToggleDeactivatedState >> isDeactivated [
	^ true
]

{ #category : #printing }
BrToggleDeactivatedState >> printOn: aStream [
	aStream nextPutAll: 'deactivated'
]
