Class {
	#name : #BrCheckboxRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Checkbox - Events'
}

{ #category : #initialization }
BrCheckboxRequest >> responseClass [
	^ BrCheckboxChanged
]
