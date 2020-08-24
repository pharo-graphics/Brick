Class {
	#name : #BrTextEditorLineParagraphSegmentSplitter,
	#superclass : #BrTextEditorLineSegmentSplitter,
	#category : #'Brick-Editor-Model - Segment-Text-Line-Paragraph'
}

{ #category : #'private - pieces computation' }
BrTextEditorLineParagraphSegmentSplitter >> itemValueType: anObject [
	"Return a type of an item within a segment.
	Note: return value should be never used explicitely, it is only needed
	for direct comparison, therefore can be any immutable object"
	<return: #Symbol>
	
	^ #char
]
