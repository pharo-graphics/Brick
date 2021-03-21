Class {
	#name : #BrViewModelAttached,
	#superclass : #BlEvent,
	#instVars : [
		'viewModel'
	],
	#category : #'Brick-Core-Events'
}

{ #category : #'instance creation' }
BrViewModelAttached class >> viewModel: aViewModel [
	^ self new viewModel: aViewModel
]

{ #category : #accessing }
BrViewModelAttached >> viewModel [
	^ viewModel
]

{ #category : #accessing }
BrViewModelAttached >> viewModel: anObject [
	viewModel := anObject
]
