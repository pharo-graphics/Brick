Class {
	#name : #BrTextEditorUpdateCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : 'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorUpdateCommand >> executeOn: aTextEditor [
	| changedFrom changedTo |
	
	changedFrom := self fromIndex. "now it is text index"
	changedTo := self toIndex. "now it is text index"

	"convert from text => to segment index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := aSegment index ]
		ifNotFound: [ 1 ].

	"convert from text => to segment index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := aSegment index ]
		ifNotFound: [ changedTo := aTextEditor segmentCollector segments size ].	

	aTextEditor notifyItemsChanged: (changedFrom to: changedTo)
]

{ #category : #accessing }
BrTextEditorUpdateCommand >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorUpdateCommand >> fromIndex: aFromTextIndex [
	fromIndex := aFromTextIndex
]

{ #category : #accessing }
BrTextEditorUpdateCommand >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorUpdateCommand >> toIndex: aToTextIndex [
	toIndex := aToTextIndex
]
