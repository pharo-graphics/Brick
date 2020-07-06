Class {
	#name : #BrTextEditorLineSegmentPieceDictionaryMap,
	#superclass : #BrTextEditorLineSegmentPieceMap,
	#instVars : [
		'map'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #accessing }
BrTextEditorLineSegmentPieceDictionaryMap >> allPieces [
	"Return all current line segment pieces"
	<return: #Collection of: #BrTextEditorLineSegmentPiece>
	
	^ map keys
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceDictionaryMap >> at: aBrTextEditorLineSegmentPiece pieceAndElementsDo: thePieceAndElementsBlock ifAbsent: anAbsentBlock [
	^ map
		associationAt: aBrTextEditorLineSegmentPiece
		ifPresent: [ :anAssociation | thePieceAndElementsBlock value: anAssociation key value: anAssociation value ]
		ifAbsent: anAbsentBlock
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceDictionaryMap >> atPiece: aBrTextEditorLineSegmentPiece putElements: aCollectionOfElements [
	map at: aBrTextEditorLineSegmentPiece put: aCollectionOfElements
]

{ #category : #initialization }
BrTextEditorLineSegmentPieceDictionaryMap >> initialize [
	super initialize.
	
	map := OrderedDictionary new
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceDictionaryMap >> pieceForElement: aBlElement ifAbsent: anAbsentBlock [
	<return: #BrTextEditorLineSegmentPiece or: #Object>

	map associations do: [ :eachAssociation |
		(eachAssociation value includes: aBlElement) 
			ifTrue: [ ^ eachAssociation key ] ].

	^ anAbsentBlock value
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceDictionaryMap >> piecesAndTheirElementsDo: aBlock [
	map associations do: [ :eachAssociation |
		| aPiece thePieceElements |
		aPiece := eachAssociation key.
		thePieceElements := eachAssociation value.
		thePieceElements do: [ :aPieceElement | aBlock value: aPiece value: aPieceElement ] ]
]
