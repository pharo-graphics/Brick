Class {
	#name : #BrTextEditorLineSegmentPieceMap,
	#superclass : #Object,
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #accessing }
BrTextEditorLineSegmentPieceMap >> allPieces [
	"Return all current line segment pieces"
	<return: #Collection of: #BrTextEditorLineSegmentPiece>
	
	^ self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceMap >> at: aBrTextEditorLineSegmentPiece pieceAndElementsDo: thePieceAndElementsBlock ifAbsent: anAbsentBlock [
	^ self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceMap >> atPiece: aBrTextEditorLineSegmentPiece putElements: aCollectionOfElements [
	self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceMap >> pieceForElement: aBlElement ifAbsent: anAbsentBlock [
	<return: #BrTextEditorLineSegmentPiece or: #Object>
	
	^ self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceMap >> piecesAndTheirElementsDo: aBlock [
	self subclassResponsibility
]
