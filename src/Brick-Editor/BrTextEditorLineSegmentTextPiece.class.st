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
	| anElement |

	anElement := (anEditorElement editor segmentBuilder wordStencilBuilder
		wordPadding: self wordPadding;
		wordMargin: self wordMargin;
		segmentPiece: self) asElement.
		
	anElement userData removeKey: #brickEditorAdornment ifAbsent: [  ].
	
	^ anElement
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
