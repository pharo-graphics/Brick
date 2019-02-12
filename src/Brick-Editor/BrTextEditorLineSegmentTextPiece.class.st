Class {
	#name : #BrTextEditorLineSegmentTextPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegmentTextPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ (anEditorElement editor segmentBuilder wordStencilBuilder
		text: self text;
		editorElement: anEditorElement) asElement
]

{ #category : #testing }
BrTextEditorLineSegmentTextPiece >> isText [
	^ true
]

{ #category : #updating }
BrTextEditorLineSegmentTextPiece >> updateText: aTextElement of: aLineSegment in: anEditorElement [
	aTextElement dispatchEvent: (BrTextEditorTextChangedRequest new editorElement: anEditorElement)
]
