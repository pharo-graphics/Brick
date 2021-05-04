Class {
	#name : #BrCheckboxAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Brick-Checkbox - Look'
}

{ #category : #'api - style' }
BrCheckboxAptitude >> checked [
	^ self styleFor: self state checked
]

{ #category : #'api - style' }
BrCheckboxAptitude >> checked: aBlock [
	aBlock value: self checked
]

{ #category : #'api - style' }
BrCheckboxAptitude >> indeterminate [
	^ self styleFor: self state indeterminate
]

{ #category : #'api - style' }
BrCheckboxAptitude >> indeterminate: aBlock [
	aBlock value: self indeterminate
]

{ #category : #accessing }
BrCheckboxAptitude >> state [
	^ BrCheckboxState
]

{ #category : #'api - style' }
BrCheckboxAptitude >> unchecked [
	^ self styleFor: self state unchecked
]

{ #category : #'api - style' }
BrCheckboxAptitude >> unchecked: aBlock [
	aBlock value: self unchecked
]
