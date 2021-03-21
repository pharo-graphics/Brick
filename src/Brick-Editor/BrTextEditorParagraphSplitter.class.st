Class {
	#name : #BrTextEditorParagraphSplitter,
	#superclass : #BrTextEditorLineSplitter,
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #'instance creation' }
BrTextEditorParagraphSplitter >> newSegment [
	^ BrTextEditorParagraphSegment new
]
