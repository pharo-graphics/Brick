Class {
	#name : #BrTextEditorFocusChangedCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'hasFocus'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorFocusChangedCommand >> executeOn: aTextEditor [
	
	aTextEditor
		notifyItemsChanged: aTextEditor segmentCollector cachedInterval
		payload: self newHolderCommand
]

{ #category : #accessing }
BrTextEditorFocusChangedCommand >> hasFocus [
	^ hasFocus
]

{ #category : #accessing }
BrTextEditorFocusChangedCommand >> hasFocus: anObject [
	hasFocus := anObject
]

{ #category : #'instance creation' }
BrTextEditorFocusChangedCommand >> newHolderCommand [
	^ BrTextEditorFocusChangedHolderCommand new
		hasFocus: self hasFocus
]
