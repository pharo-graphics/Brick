Class {
	#name : #BrTextEditorHolderCommand,
	#superclass : #Object,
	#category : 'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorHolderCommand >> executeOn: aSegmentHolder [
	self subclassResponsibility
]
