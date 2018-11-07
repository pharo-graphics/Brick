Class {
	#name : #BrTextEditorTextChangedHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorTextChangedHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder onTextChanged
]
