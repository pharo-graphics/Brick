Class {
	#name : #BrTextEditorCursorMoveCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'cursor',
		'direction'
	],
	#category : #'Brick-Editor-Commands'
}

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

{ #category : #executing }
BrTextEditorCursorMoveCommand >> executeOn: aTextEditor [

	aTextEditor segmentCollector
		cachedSegmentAt: self cursor position
		ifFound: [ :aSegment |
			aTextEditor
				notifyItemsChanged: (aSegment index to: aSegment index)
				payload: self newHolderCommand ]
		ifNotFound: [  ].
]

{ #category : #'instance creation' }
BrTextEditorCursorMoveCommand >> newHolderCommand [
	
	^ (self direction = #up
		ifTrue: [ BrTextEditorCursorMoveUpHolderCommand new ]
		ifFalse: [ BrTextEditorCursorMoveDownHolderCommand new ]) cursor: self cursor
]
