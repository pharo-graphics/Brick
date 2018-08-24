Class {
	#name : #BrTextEditorLineSegmentType,
	#superclass : #BrEditorSegmentType,
	#category : 'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #accessing }
BrTextEditorLineSegmentType >> holder [
	"Instantiate and return a new text segment holder based on my type"
	<return: #BrEditorSegmentHolder>

	^ BrTextEditorLineSegmentHolder new
]
