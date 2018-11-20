Class {
	#name : #BrTextEditorAttributedParagraphSegmentType,
	#superclass : #BrEditorSegmentType,
	#category : 'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #accessing }
BrTextEditorAttributedParagraphSegmentType >> holder [
	"Instantiate and return a new text segment holder based on my type"
	<return: #BrEditorSegmentHolder>

	^ BrTextEditorAttributedParagraphSegmentHolder new
]
