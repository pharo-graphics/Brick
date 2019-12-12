Class {
	#name : #BrTextEditorHistoryInsertionCommand,
	#superclass : #BrTextEditorHistoryCommand,
	#instVars : [
		'string',
		'index'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #printing }
BrTextEditorHistoryInsertionCommand >> gtDisplayOn: aStream [
	aStream
		nextPutAll: 'Insert'; space;
		print: self string; space;
		nextPutAll: 'at'; space;
		print: self index
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> index [
	^ index
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> index: anObject [
	index := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryInsertionCommand >> redoOn: aBrTextEditor [
	aBrTextEditor deselecter all deselect.
	
	aBrTextEditor inserter
		at: index;
		string: string;
		insert
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> string [
	^ string
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> string: anObject [
	string := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryInsertionCommand >> undoOn: aBrTextEditor [
	aBrTextEditor deselecter all deselect.
	
	aBrTextEditor deleter
		from: index to: index + string size;
		delete
]
