Class {
	#name : #BrTextEditorUpdateCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorUpdateCommand >> executeOn: aTextEditor [
	| changedFrom changedTo |
	
	changedFrom := self fromIndex. "now it is text index"
	changedTo := self toIndex. "now it is text index"

	"convert from text => to segment index => segment array index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedFrom
		ifFound: [ :aSegment | changedFrom := (aSegment index - aTextEditor segmentCollector firstIndex) + 1 ]
		ifNotFound: [ changedFrom := 1 ].

	"convert from text => to segment index => segment array index"
	aTextEditor segmentCollector
		cachedSegmentAt: changedTo
		ifFound: [ :aSegment | changedTo := (aSegment index - aTextEditor segmentCollector firstIndex) + 1 ]
		ifNotFound: [ changedTo := aTextEditor segmentCollector segments size ].	

	changedFrom to: changedTo do: [ :anIndex | (aTextEditor segmentCollector segments at: anIndex) clearCache ].
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

{ #category : #printing }
BrTextEditorUpdateCommand >> printOn: aStream [
	aStream
		nextPutAll: 'Text changed from ';
		print: self fromIndex;
		nextPutAll: ' to ';
		print: self toIndex
]

{ #category : #accessing }
BrTextEditorUpdateCommand >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorUpdateCommand >> toIndex: aToTextIndex [
	toIndex := aToTextIndex
]
