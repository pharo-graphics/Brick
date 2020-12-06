Class {
	#name : #BrEditorModeChanged,
	#superclass : #BrEditorChangedEvent,
	#instVars : [
		'mode'
	],
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorModeChanged >> initialize [
	super initialize.
	
	mode := BrTextEditorNullMode new
]

{ #category : #accessing }
BrEditorModeChanged >> mode [
	^ mode
]

{ #category : #accessing }
BrEditorModeChanged >> mode: anObject [
	mode := anObject
]
