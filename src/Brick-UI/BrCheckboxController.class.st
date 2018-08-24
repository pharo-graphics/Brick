Class {
	#name : #BrCheckboxController,
	#superclass : #BrButtonBaseController,
	#category : 'Brick-UI-Checkbox'
}

{ #category : #'as yet unclassified' }
BrCheckboxController >> isChecked [
	^ self hasActiveState: BlCheckedState
]

{ #category : #'as yet unclassified' }
BrCheckboxController >> onMouseUp: anEvent [
	self toggleState: BlCheckedState.
	widget checked: self isChecked.
	widget indeterminate: false.
	self onStateChanged.
	^ super onMouseUp: anEvent
]
