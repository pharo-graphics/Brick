Class {
	#name : #BrEditorModeRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorModeRequest >> responseClass [
	^ BrEditorModeChanged
]
