Class {
	#name : #BrTextEditorInteractionRemovedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'interaction'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorInteractionRemovedEvent >> interaction [
	^ interaction
]

{ #category : #accessing }
BrTextEditorInteractionRemovedEvent >> interaction: anObject [
	interaction := anObject
]
