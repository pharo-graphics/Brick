"
I am a root class of Model related events.
"
Class {
	#name : #BrTextEditorEvent,
	#superclass : #BlEvent,
	#instVars : [
		'editor'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorEvent >> editor [
	<return: #BrTextEditor>

	^ editor
]

{ #category : #accessing }
BrTextEditorEvent >> editor: aBrTextEditor [
	editor := aBrTextEditor
]
