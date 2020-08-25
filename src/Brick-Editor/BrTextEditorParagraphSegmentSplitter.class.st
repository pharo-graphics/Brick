Class {
	#name : #BrTextEditorParagraphSegmentSplitter,
	#superclass : #BrTextEditorLineSegmentSplitter,
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #'private - pieces computation' }
BrTextEditorParagraphSegmentSplitter >> itemValueType: anObject [
	"Return a type of an item within a segment.
	Note: return value should be never used explicitely, it is only needed
	for direct comparison, therefore can be any immutable object"
	<return: #Symbol>
	
	^ #char
]
