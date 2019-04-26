Class {
	#name : #BrTextEditorLineSegmentTextPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegmentTextPiece >> createElement: anEditorElement [
	<return: #BlElement>
	| aWordPadding aHalfOfLineSpacing |
	
	aHalfOfLineSpacing := (self segment lineSpacing / 2.0) floor.

	aWordPadding := BlInsets
		top: self segment wordPadding top + aHalfOfLineSpacing
		left: self segment wordPadding left
		bottom: self segment wordPadding bottom + (self segment lineSpacing - aHalfOfLineSpacing)
		right: self segment wordPadding right.

	^ (anEditorElement editor segmentBuilder wordStencilBuilder
		wordPadding: aWordPadding;
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
