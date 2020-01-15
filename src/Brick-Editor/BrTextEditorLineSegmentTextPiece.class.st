Class {
	#name : #BrTextEditorLineSegmentTextPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #comparing }
BrTextEditorLineSegmentTextPiece >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject text = self text
]

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
		segmentPiece: self) asElement
]

{ #category : #comparing }
BrTextEditorLineSegmentTextPiece >> hash [
	^ self class hash bitXor: self text hash
]

{ #category : #testing }
BrTextEditorLineSegmentTextPiece >> isText [
	^ true
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentTextPiece >> onRecycled: aPieceElement in: anEditorElement [
	anEditorElement editor segmentBuilder wordStencilBuilder recycle: aPieceElement
]
