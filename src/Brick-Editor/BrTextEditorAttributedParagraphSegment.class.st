Class {
	#name : #BrTextEditorAttributedParagraphSegment,
	#superclass : #BrTextEditorSegment,
	#category : 'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #testing }
BrTextEditorAttributedParagraphSegment >> hasPieces [
	^ false
]

{ #category : #accessing }
BrTextEditorAttributedParagraphSegment >> segmentType [
	"Return a type of this segment responsible for creation
	of segment holder and also used as a key for caching purposes"
	<return: #BrEditorSegmentType>
	
	^ BrTextEditorAttributedParagraphSegmentType uniqueInstance
]
