Class {
	#name : #BrScrollbarTrackChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #accessing }
BrScrollbarTrackChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrScrollbarTrackChanged >> stencil: anObject [
	stencil := anObject
]
