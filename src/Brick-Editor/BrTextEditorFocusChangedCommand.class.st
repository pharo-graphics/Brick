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
		notifyItems: aTextEditor segmentCollector cachedInterval
		event: self newHolderCommand
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
