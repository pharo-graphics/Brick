Class {
	#name : #BrEditorStylerRequest,
	#superclass : #BrEditorRequest,
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorStylerRequest >> responseClass [
	^ BrEditorStylerChanged
]
