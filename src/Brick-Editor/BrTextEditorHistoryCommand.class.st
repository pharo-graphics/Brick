Class {
	#name : #BrTextEditorHistoryCommand,
	#superclass : #Object,
	#category : #'Brick-Editor-History'
}

{ #category : #'api - undo/redo' }
BrTextEditorHistoryCommand >> redoOn: aBrTextEditor [
	self subclassResponsibility
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryCommand >> undoOn: aBrTextEditor [
	self subclassResponsibility
]
