"
I am responsible for building and updating segments.

I know what to do with the segment structure when we insert or delete a piece of text from the editor.

I take a piece of text and split it into segments.
"
Class {
	#name : #BrTextEditorSegmentBuilder,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'splitter'
	],
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #'text - modifications' }
BrTextEditorSegmentBuilder >> addedAttribute: anAttribute from: aFromIndex to: aToIndex in: aBrTextEditor [
	"Is sent after an attribute was added in provided text editor"

	self subclassResponsibility
]

{ #category : #initialization }
BrTextEditorSegmentBuilder >> defaultSplitter [
	<return: #BrTextEditorSplitter>

	^ self subclassResponsibility
]

{ #category : #'text - modifications' }
BrTextEditorSegmentBuilder >> deletedFrom: aFromIndex to: aToIndex in: aBrTextEditor [
	"Is sent after a piece of text is deleted within from and to index interval in provided text editor"

	self subclassResponsibility
]

{ #category : #initialization }
BrTextEditorSegmentBuilder >> initialize [
	super initialize.

	splitter := self defaultSplitter
]

{ #category : #'text - modifications' }
BrTextEditorSegmentBuilder >> insertedString: aString at: aTextIndex in: aBrTextEditor [
	"Is sent after a String was inserted at a given index in provided text editor"

	self subclassResponsibility
]

{ #category : #splitting }
BrTextEditorSegmentBuilder >> split: aBrText in: aStream [
	self splitter split: aBrText in: aStream
]

{ #category : #splitting }
BrTextEditorSegmentBuilder >> split: aBrText in: aBrEditorSegmentStream offset: anOffset [
	self splitter split: aBrText in: aBrEditorSegmentStream offset: anOffset
]

{ #category : #accessing }
BrTextEditorSegmentBuilder >> splitter [
	<return: #BrTextEditorSplitter>

	^ splitter
]

{ #category : #accessing }
BrTextEditorSegmentBuilder >> splitter: aBrTextEditorSplitter [
	self
		assert: [ aBrTextEditorSplitter isNotNil ]
		description: [ 'Splitter must not be nil' ].

	splitter := aBrTextEditorSplitter
]
