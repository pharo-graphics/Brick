Class {
	#name : #BrTextEditorInvalidateCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorInvalidateCommand >> executeOn: aTextEditor [
	| changedFrom changedTo |
	
	changedFrom := self fromIndex. "now it is text index"
	changedTo := self toIndex. "now it is text index"

	"convert from text => to segment index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ changedFrom := 1 ].

	"convert from text => to segment index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor segmentCollector segments size ].
		
	aTextEditor
		enqueueHolderCommand: self newHolderCommand
		interval: (changedFrom to: changedTo)
]

{ #category : #accessing }
BrTextEditorInvalidateCommand >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorInvalidateCommand >> fromIndex: aFromTextIndex [
	fromIndex := aFromTextIndex
]

{ #category : #'instance creation' }
BrTextEditorInvalidateCommand >> newHolderCommand [
	^ BrTextEditorTextChangedHolderCommand new
]

{ #category : #accessing }
BrTextEditorInvalidateCommand >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorInvalidateCommand >> toIndex: aToTextIndex [
	toIndex := aToTextIndex
]
