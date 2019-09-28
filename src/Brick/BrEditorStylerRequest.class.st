Class {
	#name : #BrEditorStylerRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorStylerRequest >> responseClass [
	^ BrEditorStylerChanged
]
