Class {
	#name : #BrCheckboxCheckedState,
	#superclass : #BrCheckboxState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #testing }
BrCheckboxCheckedState >> isChecked [
	^ true
]

{ #category : #printing }
BrCheckboxCheckedState >> printOn: aStream [
	aStream nextPutAll: 'checked'
]
