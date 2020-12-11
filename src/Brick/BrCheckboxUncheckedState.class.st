Class {
	#name : #BrCheckboxUncheckedState,
	#superclass : #BrCheckboxState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #testing }
BrCheckboxUncheckedState >> isUnchecked [
	^ true
]

{ #category : #printing }
BrCheckboxUncheckedState >> printOn: aStream [
	aStream nextPutAll: 'unchecked'
]
