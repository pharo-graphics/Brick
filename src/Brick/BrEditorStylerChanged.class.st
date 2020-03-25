Class {
	#name : #BrEditorStylerChanged,
	#superclass : #BrEditorChangedEvent,
	#instVars : [
		'styler'
	],
	#category : #'Brick-Editor - Events'
}

{ #category : #accessing }
BrEditorStylerChanged class >> styler: aStyler [
	^ self new styler: aStyler
]

{ #category : #accessing }
BrEditorStylerChanged >> styler [
	^ styler
]

{ #category : #accessing }
BrEditorStylerChanged >> styler: anObject [
	styler := anObject
]
