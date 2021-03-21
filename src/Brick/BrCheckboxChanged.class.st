Class {
	#name : #BrCheckboxChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'state'
	],
	#category : #'Brick-Checkbox - Events'
}

{ #category : #initialization }
BrCheckboxChanged >> initialize [
	super initialize.
	
	state := BrCheckboxState unchecked
]

{ #category : #testing }
BrCheckboxChanged >> isChecked [
	^ self state = BrCheckboxState checked
]

{ #category : #testing }
BrCheckboxChanged >> isIndeterminate [
	^ self state = BrCheckboxState indeterminate
]

{ #category : #testing }
BrCheckboxChanged >> isUnchecked [
	^ self state = BrCheckboxState unchecked
]

{ #category : #accessing }
BrCheckboxChanged >> state [
	<return: #BrCheckboxState>

	^ state
]

{ #category : #accessing }
BrCheckboxChanged >> state: aBrCheckboxState [
	state := aBrCheckboxState
]
