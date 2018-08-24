Class {
	#name : #BrTextEditorAttributedLineSplitter,
	#superclass : #BrTextEditorLineSplitter,
	#category : 'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #'instance creation' }
BrTextEditorAttributedLineSplitter >> newSegment [
	^ BrTextEditorAttributedLineSegment new
]
