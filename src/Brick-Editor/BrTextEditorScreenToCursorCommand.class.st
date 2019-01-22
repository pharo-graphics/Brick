Class {
	#name : #BrTextEditorScreenToCursorCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'transformation'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorScreenToCursorCommand >> executeOn: aTextEditor [
	self transformation evaluateOn: self for: aTextEditor
]

{ #category : #executing }
BrTextEditorScreenToCursorCommand >> explicitScreenToCursor: aTransformation for: aTextEditor [

	"we convert a pure screen position, should send to all segment holders"
	aTextEditor
		notifyItems: aTextEditor segmentCollector cachedInterval
		event: self newHolderCommand
]

{ #category : #'instance creation' }
BrTextEditorScreenToCursorCommand >> newHolderCommand [
	^ BrTextEditorScreenToCursorHolderCommand new
		transformation: self transformation
]

{ #category : #accessing }
BrTextEditorScreenToCursorCommand >> transformation [
	^ transformation
]

{ #category : #accessing }
BrTextEditorScreenToCursorCommand >> transformation: anObject [
	transformation := anObject
]
