"
I am sent when a cursor related change happened at a given text position.

It can be that a cursor was removed from this position or added at it
"
Class {
	#name : #BrTextEditorCursorChangeCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'position'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorCursorChangeCommand >> executeOn: aTextEditor [
	aTextEditor segmentCollector
		cachedSegmentAt: self position
		ifFound: [ :aSegment |
			aTextEditor
				notifyItemsChanged: (aSegment index to: aSegment index)
				payload: self newHolderCommand ]
		ifNotFound: [  ]
]

{ #category : #'instance creation' }
BrTextEditorCursorChangeCommand >> newHolderCommand [
	^ BrTextEditorCursorChangedHolderCommand new
]

{ #category : #accessing }
BrTextEditorCursorChangeCommand >> position [
	^ position
]

{ #category : #accessing }
BrTextEditorCursorChangeCommand >> position: anObject [
	position := anObject
]
