Class {
	#name : #BrCheckboxLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Checkbox - Look'
}

{ #category : #'api - style' }
BrCheckboxLook >> checked: aBlock [
	self
		when: self state checked
		style: aBlock
]

{ #category : #'api - style' }
BrCheckboxLook >> indeterminate: aBlock [
	self
		when: self state indeterminate
		style: aBlock
]

{ #category : #accessing }
BrCheckboxLook >> state [
	^ BrCheckboxState
]

{ #category : #'api - style' }
BrCheckboxLook >> unchecked: aBlock [
	self
		when: self state unchecked
		style: aBlock
]
