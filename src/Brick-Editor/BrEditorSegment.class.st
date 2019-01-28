"
Editor only measures and renders visible distinct pieces of objects that is why we should split the whole editable object in so called segments.

I represent such segment
"
Class {
	#name : #BrEditorSegment,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'index'
	],
	#category : 'Brick-Editor-Model - Segment'
}

{ #category : #'pieces - computation' }
BrEditorSegment >> clearCache [
	"Clear all caches and make this segment fresh as if it would just be created and initalized"
]

{ #category : #accessing }
BrEditorSegment >> index [
	"Return segment index within BrEditor.
	Note: index can not be nil"
	<return: #Number>
	
	self
		assert: [ index isNotNil ]
		description: [ 'Index can not be nil' ].

	^ index
]

{ #category : #accessing }
BrEditorSegment >> index: aNumber [
	index := aNumber
]

{ #category : #testing }
BrEditorSegment >> isFirstIn: aTextEditor [
	"Return true if I am absolutely the very first segment (not first cached) in a given text editor"

	^ self index = 1
]

{ #category : #testing }
BrEditorSegment >> isLastIn: aTextEditor [
	"Return true if I am absolutely the very last segment (not last cached) in a given text editor"

	^ self index = aTextEditor segmentCollector segments size
]

{ #category : #accessing }
BrEditorSegment >> segmentType [
	"Return a type of this segment responsible for creation
	of segment holder and also used as a key for caching purposes"
	<return: #BrEditorSegmentType>
	
	^ self subclassResponsibility
]
