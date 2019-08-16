"
I am responsible for splitting a given piece of text into segments
"
Class {
	#name : #BrTextEditorSplitter,
	#superclass : #Object,
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #'api - splitting' }
BrTextEditorSplitter >> split: aBlText in: aBrEditorSegmentStream [
	self
		split: (aBlText from: (1 min: aBlText size) to: aBlText size)
		in: aBrEditorSegmentStream
		offset: 0
]

{ #category : #'api - splitting' }
BrTextEditorSplitter >> split: aBrText in: aBrEditorSegmentStream offset: anOffset [
	self subclassResponsibility
]
