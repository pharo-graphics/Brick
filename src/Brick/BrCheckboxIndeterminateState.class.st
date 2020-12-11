Class {
	#name : #BrCheckboxIndeterminateState,
	#superclass : #BrCheckboxState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #testing }
BrCheckboxIndeterminateState >> isIndeterminate [
	^ true
]

{ #category : #printing }
BrCheckboxIndeterminateState >> printOn: aStream [
	aStream nextPutAll: 'indeterminate'
]
