Class {
	#name : #BrTextEditorHistoryDeletionCommand,
	#superclass : #BrTextEditorHistoryCommand,
	#instVars : [
		'text',
		'index'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #printing }
BrTextEditorHistoryDeletionCommand >> gtDisplayOn: aStream [
	aStream
		nextPutAll: 'Delete'; space;
		print: self text; space;
		nextPutAll: 'at'; space;
		print: self index
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> index [
	^ index
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> index: anObject [
	index := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryDeletionCommand >> redoOn: aBrTextEditor [
	aBrTextEditor deselecter all deselect.
	
	aBrTextEditor deleter
		from: index - 1 to: index - 1 + text size;
		delete
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> text: anObject [
	text := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryDeletionCommand >> undoOn: aBrTextEditor [
	aBrTextEditor deselecter all deselect.
	
	aBrTextEditor inserter
		at: index - 1;
		string: text characters asString;
		insert
]
