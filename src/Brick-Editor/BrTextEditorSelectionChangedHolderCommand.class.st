"
I trigger a selection update in the text piece
"
Class {
	#name : #BrTextEditorSelectionChangedHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorSelectionChangedHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder onSelectionChanged
]
