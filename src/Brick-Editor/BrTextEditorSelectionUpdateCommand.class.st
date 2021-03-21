"
I do the hard job of visually updating selection by requesting segment holders to partially update themselves
"
Class {
	#name : #BrTextEditorSelectionUpdateCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorSelectionUpdateCommand >> executeOn: aTextEditor [
	| changedFrom changedTo |
	
	changedFrom := self fromIndex.

	changedTo := self toIndex.

	aTextEditor segmentCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ 1 ].

	aTextEditor segmentCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor segmentCollector segments size ].	
	
	aTextEditor
		enqueueHolderCommand: self newHolderCommand
		interval: (changedFrom to: changedTo)
]

{ #category : #accessing }
BrTextEditorSelectionUpdateCommand >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorSelectionUpdateCommand >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #'instance creation' }
BrTextEditorSelectionUpdateCommand >> newHolderCommand [
	^ BrTextEditorSelectionChangedHolderCommand new
]

{ #category : #accessing }
BrTextEditorSelectionUpdateCommand >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorSelectionUpdateCommand >> toIndex: anObject [
	toIndex := anObject
]
