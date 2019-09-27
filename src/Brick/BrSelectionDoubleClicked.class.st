Class {
	#name : #BrSelectionDoubleClicked,
	#superclass : #BlEvent,
	#instVars : [
		'selection',
		'sourceEvent'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #accessing }
BrSelectionDoubleClicked >> selection [
	^ selection
]

{ #category : #accessing }
BrSelectionDoubleClicked >> selection: anObject [
	selection := anObject
]

{ #category : #accessing }
BrSelectionDoubleClicked >> sourceEvent [
	^ sourceEvent
]

{ #category : #accessing }
BrSelectionDoubleClicked >> sourceEvent: anObject [
	sourceEvent := anObject
]
