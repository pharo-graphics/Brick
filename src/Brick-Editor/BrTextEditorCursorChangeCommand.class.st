Class {
	#name : #BrTextEditorCursorChangeCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'position'
	],
	#category : 'Brick-Editor-Commands'
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
