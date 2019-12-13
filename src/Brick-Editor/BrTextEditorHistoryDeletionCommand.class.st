Class {
	#name : #BrTextEditorHistoryDeletionCommand,
	#superclass : #BrTextEditorHistoryCommand,
	#instVars : [
		'texts',
		'undoIndices',
		'redoIndices'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #printing }
BrTextEditorHistoryDeletionCommand >> gtDisplayOn: aStream [
	aStream nextPutAll: 'Delete'.
	texts
		with: undoIndices
		do: [ :eachString :eachIndex |
			aStream
				space;
				print: eachString; space;
				nextPutAll: 'at'; space;
				print: eachIndex;
				nextPut: $, ].
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> redoIndices [
	^ redoIndices
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> redoIndices: anObject [
	redoIndices := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryDeletionCommand >> redoOn: aBrTextEditor [
	| aDeleter |
	aBrTextEditor deselecter all deselect.
	
	aDeleter := aBrTextEditor deleter.
	texts
		with: redoIndices
		do: [ :eachText :eachIndex | aDeleter from: eachIndex to: eachIndex + eachText size ].
	
	aDeleter delete
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> texts [
	^ texts
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> texts: anObject [
	texts := anObject
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> undoIndices [
	^ undoIndices
]

{ #category : #accessing }
BrTextEditorHistoryDeletionCommand >> undoIndices: anObject [
	undoIndices := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryDeletionCommand >> undoOn: aBrTextEditor [
	| anInserter |
	aBrTextEditor deselecter all deselect.
	
	anInserter := aBrTextEditor inserter.
	texts
		with: undoIndices
		do: [ :eachText :eachIndex | anInserter text: eachText characters asString; at: eachIndex - 1 ].
	anInserter insert
]
