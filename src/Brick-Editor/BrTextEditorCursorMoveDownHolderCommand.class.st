Class {
	#name : #BrTextEditorCursorMoveDownHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#instVars : [
		'cursor'
	],
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #accessing }
BrTextEditorCursorMoveDownHolderCommand >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorMoveDownHolderCommand >> cursor: anObject [
	cursor := anObject
]

{ #category : #executing }
BrTextEditorCursorMoveDownHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder moveCursorDown: self cursor
]

{ #category : #sending }
BrTextEditorCursorMoveDownHolderCommand >> sendTo: aSegmentHolder [
	aSegmentHolder moveCursorDown: self cursor
]
