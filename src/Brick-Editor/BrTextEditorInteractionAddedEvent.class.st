Class {
	#name : #BrTextEditorInteractionAddedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'interaction'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorInteractionAddedEvent >> interaction [
	^ interaction
]

{ #category : #accessing }
BrTextEditorInteractionAddedEvent >> interaction: anObject [
	interaction := anObject
]
