Class {
	#name : #BrCheckboxCheckedState,
	#superclass : #BrCheckboxState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #printing }
BrCheckboxCheckedState >> printOn: aStream [
	aStream nextPutAll: 'checked'
]
