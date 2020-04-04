Class {
	#name : #BrCheckboxIndeterminateState,
	#superclass : #BrCheckboxState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #printing }
BrCheckboxIndeterminateState >> printOn: aStream [
	aStream nextPutAll: 'indeterminate'
]
