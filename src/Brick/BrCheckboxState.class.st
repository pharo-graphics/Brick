Class {
	#name : #BrCheckboxState,
	#superclass : #BrInteractionState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #'instance creation' }
BrCheckboxState class >> checked [
	^ BrCheckboxCheckedState new
]

{ #category : #'instance creation' }
BrCheckboxState class >> indeterminate [
	^ BrCheckboxIndeterminateState new
]

{ #category : #'instance creation' }
BrCheckboxState class >> unchecked [
	^ BrCheckboxUncheckedState new
]
