"
I trigger a focus state update in the text piece
"
Class {
	#name : #BrTextEditorFocusChangedHolderCommand,
	#superclass : #BrTextEditorHolderCommand,
	#instVars : [
		'hasFocus'
	],
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #executing }
BrTextEditorFocusChangedHolderCommand >> executeOn: aSegmentHolder [
	aSegmentHolder onFocusChanged: self hasFocus
]

{ #category : #accessing }
BrTextEditorFocusChangedHolderCommand >> hasFocus [
	^ hasFocus
]

{ #category : #accessing }
BrTextEditorFocusChangedHolderCommand >> hasFocus: aBoolean [
	hasFocus := aBoolean
]
