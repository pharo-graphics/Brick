Class {
	#name : #BrTextEditorCursorChangedHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#category : 'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorCursorChangedHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder onCursorChanged
]
