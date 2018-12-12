"
I am a payload to trigger partial text update without re-creation of text pieces
"
Class {
	#name : #BrTextEditorHolderCommand,
	#superclass : #BlEvent,
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorHolderCommand >> executeOn: aSegmentHolder [
	self subclassResponsibility
]
