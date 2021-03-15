Class {
	#name : #BrTextEditorTextStyleRequested,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'afterAction'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorTextStyleRequested >> afterAction [
	^ afterAction
]

{ #category : #accessing }
BrTextEditorTextStyleRequested >> afterAction: anObject [
	afterAction := anObject
]
