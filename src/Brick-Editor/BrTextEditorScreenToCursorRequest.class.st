Class {
	#name : #BrTextEditorScreenToCursorRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'transformation'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorScreenToCursorRequest >> transformation [
	^ transformation
]

{ #category : #accessing }
BrTextEditorScreenToCursorRequest >> transformation: anObject [
	transformation := anObject
]
