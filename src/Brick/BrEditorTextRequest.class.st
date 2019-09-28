Class {
	#name : #BrEditorTextRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorTextRequest >> responseClass [
	^ BrEditorTextChanged
]
