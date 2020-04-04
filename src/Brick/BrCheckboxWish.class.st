Class {
	#name : #BrCheckboxWish,
	#superclass : #BrWish,
	#instVars : [
		'state'
	],
	#category : #'Brick-Checkbox - Events'
}

{ #category : #'instance creation' }
BrCheckboxWish class >> checked [
	^ self new state: BrCheckboxState checked
]

{ #category : #'instance creation' }
BrCheckboxWish class >> indeterminate [
	^ self new state: BrCheckboxState indeterminate
]

{ #category : #'instance creation' }
BrCheckboxWish class >> state: aBrCheckboxState [
	^ self new state: aBrCheckboxState
]

{ #category : #'instance creation' }
BrCheckboxWish class >> unchecked [
	^ self new state: BrCheckboxState unchecked
]

{ #category : #accessing }
BrCheckboxWish >> state [
	<return: #BrCheckboxState>

	^ state
]

{ #category : #accessing }
BrCheckboxWish >> state: aBrCheckboxState [
	state := aBrCheckboxState
]
