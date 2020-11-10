Class {
	#name : #BrTextEditorMemento,
	#superclass : #Object,
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #accessing }
BrTextEditorMemento >> order [
	^ self subclassResponsibility
]

{ #category : #memento }
BrTextEditorMemento >> restoreStateOf: aTextEditor [
	self subclassResponsibility
]

{ #category : #memento }
BrTextEditorMemento >> saveStateOf: aTextEditor [
	self subclassResponsibility
]
