Class {
	#name : #BrCheckboxLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Checkbox - Look'
}

{ #category : #'api - style' }
BrCheckboxLook >> checked [
	^ self styleFor: self state checked
]

{ #category : #'api - style' }
BrCheckboxLook >> checked: aBlock [
	aBlock value: self checked
]

{ #category : #'api - style' }
BrCheckboxLook >> indeterminate [
	^ self styleFor: self state indeterminate
]

{ #category : #'api - style' }
BrCheckboxLook >> indeterminate: aBlock [
	aBlock value: self indeterminate
]

{ #category : #accessing }
BrCheckboxLook >> state [
	^ BrCheckboxState
]

{ #category : #'api - style' }
BrCheckboxLook >> unchecked [
	^ self styleFor: self state unchecked
]

{ #category : #'api - style' }
BrCheckboxLook >> unchecked: aBlock [
	aBlock value: self unchecked
]
