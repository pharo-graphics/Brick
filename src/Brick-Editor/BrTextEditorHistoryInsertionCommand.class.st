Class {
	#name : #BrTextEditorHistoryInsertionCommand,
	#superclass : #BrTextEditorHistoryCommand,
	#instVars : [
		'strings',
		'undoIndices',
		'redoIndices'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #printing }
BrTextEditorHistoryInsertionCommand >> gtDisplayOn: aStream [
	
	aStream nextPutAll: 'Insert'.
	strings
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
BrTextEditorHistoryInsertionCommand >> redoIndices [
	^ redoIndices
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> redoIndices: anObject [
	redoIndices := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryInsertionCommand >> redoOn: aBrTextEditor [
	| anInserter |
	aBrTextEditor deselecter all deselect.
	
	anInserter := aBrTextEditor inserter.
	strings
		with: redoIndices
		do: [ :eachString :eachIndex | anInserter text: eachString; at: eachIndex ].
	anInserter insert
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> strings [
	^ strings
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> strings: anObject [
	strings := anObject
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> undoIndices [
	^ undoIndices
]

{ #category : #accessing }
BrTextEditorHistoryInsertionCommand >> undoIndices: anObject [
	undoIndices := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryInsertionCommand >> undoOn: aBrTextEditor [
	| aDeleter |
	aBrTextEditor deselecter all deselect.
	aDeleter := aBrTextEditor deleter.
	strings with: undoIndices do: [ :eachString :eachIndex | 
		aDeleter from: eachIndex to: eachIndex + eachString size ].
	aDeleter delete
]
