Class {
	#name : #BrTabToolbarChangedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #sending }
BrTabToolbarChangedEvent >> sendTo: anObject [
	anObject tabToolbarChanged: self
]

{ #category : #accessing }
BrTabToolbarChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabToolbarChangedEvent >> stencil: anObject [
	stencil := anObject
]
