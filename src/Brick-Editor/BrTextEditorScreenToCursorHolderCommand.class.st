Class {
	#name : #BrTextEditorScreenToCursorHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#instVars : [
		'transformation'
	],
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorScreenToCursorHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder screenToCursor: self transformation
]

{ #category : #accessing }
BrTextEditorScreenToCursorHolderCommand >> transformation [
	^ transformation
]

{ #category : #accessing }
BrTextEditorScreenToCursorHolderCommand >> transformation: anObject [
	transformation := anObject
]
