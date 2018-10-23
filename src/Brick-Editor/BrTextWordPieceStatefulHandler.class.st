Class {
	#name : #BrTextWordPieceStatefulHandler,
	#superclass : #BrTextWordPieceHandler,
	#instVars : [
		'editorElement'
	],
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceStatefulHandler >> editorElement [
	<return: #BrEditorElement>

	^ editorElement
]

{ #category : #accessing }
BrTextWordPieceStatefulHandler >> editorElement: aEditorElement [
	editorElement := aEditorElement
]
