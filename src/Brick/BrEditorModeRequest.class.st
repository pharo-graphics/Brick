Class {
	#name : #BrEditorModeRequest,
	#superclass : #BrEditorRequest,
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorModeRequest >> responseClass [
	^ BrEditorModeChanged
]
