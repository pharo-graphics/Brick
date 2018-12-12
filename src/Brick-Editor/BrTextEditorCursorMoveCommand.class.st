Class {
	#name : #BrTextEditorCursorMoveCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'cursor',
		'direction'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #actions }
BrTextEditorCursorMoveCommand class >> down [
	^ self new down
]

{ #category : #actions }
BrTextEditorCursorMoveCommand class >> up [
	^ self new up
]

{ #category : #accessing }
BrTextEditorCursorMoveCommand >> cursor [
	<return: #BrTextEditorSingleCursor>

	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorMoveCommand >> cursor: aSingleCursor [
	cursor := aSingleCursor
]

{ #category : #accessing }
BrTextEditorCursorMoveCommand >> direction [
	^ direction
]

{ #category : #accessing }
BrTextEditorCursorMoveCommand >> direction: aSymbol [
	direction := aSymbol
]

{ #category : #accessing }
BrTextEditorCursorMoveCommand >> down [
	direction := #down
]

{ #category : #executing }
BrTextEditorCursorMoveCommand >> executeOn: aTextEditor [

	aTextEditor segmentCollector
		cachedSegmentAt: self cursor position
		ifFound: [ :aSegment |
			aTextEditor
				notifyItems: (aSegment index to: aSegment index)
				event: self newHolderCommand ]
		ifNotFound: [  ].
]

{ #category : #'instance creation' }
BrTextEditorCursorMoveCommand >> newHolderCommand [
	
	^ (self direction = #up
		ifTrue: [ BrTextEditorCursorMoveUpHolderCommand new ]
		ifFalse: [ BrTextEditorCursorMoveDownHolderCommand new ]) cursor: self cursor
]

{ #category : #accessing }
BrTextEditorCursorMoveCommand >> up [
	direction := #up
]
