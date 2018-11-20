"
I am used by ===BrTextEditorSegmentBuilder=== to stream created segments so that ===BrTextEditorSegmentsCollector=== could collect them.
"
Class {
	#name : #BrEditorSegmentStream,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'limit',
		'collection',
		'skip'
	],
	#category : 'Brick-Editor-Model - Segment'
}

{ #category : #accessing }
BrEditorSegmentStream >> collection [
	^ collection
]

{ #category : #accessing }
BrEditorSegmentStream >> collection: anObject [
	collection := anObject
]

{ #category : #initialization }
BrEditorSegmentStream >> initialize [
	super initialize.
	
	collection := OrderedCollection new.
	limit := 100.
	skip := 0
]

{ #category : #accessing }
BrEditorSegmentStream >> limit [
	^ limit
]

{ #category : #accessing }
BrEditorSegmentStream >> limit: aNumber [
	limit := aNumber
]

{ #category : #streaming }
BrEditorSegmentStream >> nextPut: aTextEditorSegment [
	self
		assert: [ self wantsMore ]
		description: [ 'Stream is full, can not add more!' ].
	
	self
		assert: [ skip >= 0 ]
		description: [ 'Skip count must not be negative' ].
	
	skip isZero
		ifTrue: [ collection add: aTextEditorSegment ]
		ifFalse: [ skip := skip - 1 ]
]

{ #category : #accessing }
BrEditorSegmentStream >> segments [
	"Return a collection of streamed text segments.
	I am an alias to #collection allowing us to increase readability"
	<return: #Collection of: #BrTextEditorSegment>

	^ self collection
]

{ #category : #accessing }
BrEditorSegmentStream >> size [
	^ collection size
]

{ #category : #accessing }
BrEditorSegmentStream >> skip [
	^ skip
]

{ #category : #accessing }
BrEditorSegmentStream >> skip: aNumber [

	self
		assert: [ aNumber isInteger ]
		description: [ 'Skip count must be integer' ].

	skip := aNumber
]

{ #category : #testing }
BrEditorSegmentStream >> wantsMore [
	^ self size < self limit
]
