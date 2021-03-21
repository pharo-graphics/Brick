Class {
	#name : #BrEditorTextRequest,
	#superclass : #BrEditorRequest,
	#category : #'Brick-Editor - Events'
}

{ #category : #initialization }
BrEditorTextRequest >> responseClass [
	^ BrEditorTextChanged
]
