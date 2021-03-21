Class {
	#name : #BrTextEditorLineSegmentPieceCollectionMap,
	#superclass : #BrTextEditorLineSegmentPieceMap,
	#instVars : [
		'map'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #accessing }
BrTextEditorLineSegmentPieceCollectionMap >> allPieces [
	"Return all current line segment pieces"
	<return: #Collection of: #BrTextEditorLineSegmentPiece>

	^ map collect: [ :eachAssociation | eachAssociation key ]
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceCollectionMap >> at: aBrTextEditorLineSegmentPiece pieceAndElementsDo: thePieceAndElementsBlock ifAbsent: anAbsentBlock [
	^ map
		detect: [ :eachAssociation | eachAssociation key = aBrTextEditorLineSegmentPiece ]
		ifFound: [ :eachAssociation | thePieceAndElementsBlock value: eachAssociation key value: eachAssociation value ]
		ifNone: anAbsentBlock
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceCollectionMap >> atPiece: aBrTextEditorLineSegmentPiece putElements: aCollectionOfElements [
	map add: (aBrTextEditorLineSegmentPiece -> aCollectionOfElements)
]

{ #category : #initialization }
BrTextEditorLineSegmentPieceCollectionMap >> initialize [
	super initialize.
	
	map := OrderedCollection new.
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceCollectionMap >> pieceForElement: aBlElement ifAbsent: anAbsentBlock [
	map do: [ :eachAssociation |
		(eachAssociation value includes: aBlElement) 
			ifTrue: [ ^ eachAssociation key ] ].
	^ anAbsentBlock value
]

{ #category : #accessing }
BrTextEditorLineSegmentPieceCollectionMap >> piecesAndTheirElementsDo: aBlock [
	map do: [ :eachAssociation |
		| aPiece thePieceElements |
		aPiece := eachAssociation key.
		thePieceElements := eachAssociation value.
		thePieceElements do: [ :aPieceElement | aBlock value: aPiece value: aPieceElement ] ]
]
