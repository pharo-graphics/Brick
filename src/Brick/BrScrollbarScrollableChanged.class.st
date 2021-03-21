Class {
	#name : #BrScrollbarScrollableChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'scrollableElement'
	],
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #accessing }
BrScrollbarScrollableChanged >> scrollableElement [
	^ scrollableElement
]

{ #category : #accessing }
BrScrollbarScrollableChanged >> scrollableElement: anObject [
	scrollableElement := anObject
]
