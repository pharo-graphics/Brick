Class {
	#name : #BrCheckboxUncheckedState,
	#superclass : #BrCheckboxState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #printing }
BrCheckboxUncheckedState >> printOn: aStream [
	aStream nextPutAll: 'unchecked'
]
