Class {
	#name : #BrTabGroupActionbarChangedEvent,
	#superclass : #BrTabGroupEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #accessing }
BrTabGroupActionbarChangedEvent >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTabGroupActionbarChangedEvent >> stencil: anObject [
	stencil := anObject
]
