Class {
	#name : #BrTextEditorSplitter,
	#superclass : #Object,
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #splitting }
BrTextEditorSplitter >> split: aBrText in: aBrEditorSegmentStream [
	self subclassResponsibility
]
