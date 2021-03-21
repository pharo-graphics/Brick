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
		enqueueHolderCommand: self newHolderCommand
		interval: aTextEditor segmentCollector cachedInterval
]

{ #category : #'instance creation' }
BrTextEditorScreenToCursorCommand >> newHolderCommand [
	^ BrTextEditorScreenToCursorHolderCommand new
		transformation: self transformation
]

{ #category : #executing }
BrTextEditorScreenToCursorCommand >> relativeScreenToCursor: aTransformation for: aTextEditor [

	"we convert a pure screen position, should send to all segment holders"
	aTextEditor segmentCollector
		cachedSegmentAt: self transformation cursor position
		ifFound: [ :aSegment |
			aTextEditor
				enqueueHolderCommand: self newHolderCommand
				interval: (aSegment index to: aSegment index) ]
		ifNotFound: [  ].
]

{ #category : #accessing }
BrTextEditorScreenToCursorCommand >> transformation [
	^ transformation
]

{ #category : #accessing }
BrTextEditorScreenToCursorCommand >> transformation: anObject [
	transformation := anObject
]
