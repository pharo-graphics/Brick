Class {
	#name : #BrTabToolbarChangedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #accessing }
BrTabToolbarChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabToolbarChangedEvent >> stencil: anObject [
	stencil := anObject
]
