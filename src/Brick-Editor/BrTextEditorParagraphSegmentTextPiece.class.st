Class {
	#name : #BrTextEditorParagraphSegmentTextPiece,
	#superclass : #BrTextEditorParagraphSegmentPiece,
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #comparing }
BrTextEditorParagraphSegmentTextPiece >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject text = self text
]

{ #category : #'instance creation' }
BrTextEditorParagraphSegmentTextPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ (anEditorElement editor segmentBuilder wordStencilBuilder
		wordPadding: self wordPadding;
		wordMargin: self wordMargin;
		segmentPiece: self) asElement
]

{ #category : #comparing }
BrTextEditorParagraphSegmentTextPiece >> hash [
	^ self class hash bitXor: self text hash
]

{ #category : #testing }
BrTextEditorParagraphSegmentTextPiece >> isText [
	^ true
]

{ #category : #'instance creation' }
BrTextEditorParagraphSegmentTextPiece >> onRecycled: aPieceElement in: anEditorElement [
	anEditorElement editor segmentBuilder wordStencilBuilder recycle: aPieceElement
]
