Class {
	#name : #BrTextEditorParagraphSegmentType,
	#superclass : #BrEditorSegmentType,
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #accessing }
BrTextEditorParagraphSegmentType >> holder [
	"Instantiate and return a new text segment holder based on my type"
	<return: #BrEditorSegmentHolder>

	^ BrTextEditorParagraphSegmentHolder new
]
