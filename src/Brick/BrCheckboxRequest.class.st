Class {
	#name : #BrCheckboxRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrCheckboxRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrCheckboxRequest >> responseClass [
	^ BrCheckboxChanged
]
