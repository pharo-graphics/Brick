Class {
	#name : #BrToggle,
	#superclass : #BrButton,
	#instVars : [
		'toggleModel'
	],
	#category : #'Brick-Toggle - UI'
}

{ #category : #'api - toggle' }
BrToggle >> activate [
	toggleModel activate
]

{ #category : #'api - toggle' }
BrToggle >> activated: aBoolean [
	toggleModel activated: aBoolean
]

{ #category : #'api - toggle' }
BrToggle >> deactivate [
	toggleModel deactivate
]

{ #category : #initialization }
BrToggle >> initialize [
	super initialize.
	self viewModel: self viewModel + (toggleModel := BrToggleModel new)
]

{ #category : #'api - toggle' }
BrToggle >> isActivated [
	<return: #Boolean>
	^ toggleModel isActivated
]

{ #category : #'api - toggle' }
BrToggle >> toggle [
	toggleModel toggle
]
