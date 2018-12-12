Class {
	#name : #BrTextEditorCursorMoveUpHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#instVars : [
		'cursor'
	],
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #accessing }
BrTextEditorCursorMoveUpHolderCommand >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorMoveUpHolderCommand >> cursor: anObject [
	cursor := anObject
]

{ #category : #executing }
BrTextEditorCursorMoveUpHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder moveCursorUp: self cursor
]

{ #category : #executing }
BrTextEditorCursorMoveUpHolderCommand >> sendTo: aSegmentHolder [
	aSegmentHolder moveCursorUp: self cursor
]
