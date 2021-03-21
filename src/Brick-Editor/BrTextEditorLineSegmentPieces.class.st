Class {
	#name : #BrTextEditorLineSegmentPieces,
	#superclass : #Object,
	#instVars : [
		'pieces',
		'pieceElements',
		'textElements',
		'adornmentElements'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #initialization }
BrTextEditorLineSegmentPieces >> initialize [
	super initialize.
	
	pieces := OrderedCollection new.
	
	pieceElements := OrderedCollection new.
	textElements := OrderedCollection new.
	adornmentElements := OrderedCollection new
]

{ #category : #accessing }
BrTextEditorLineSegmentPieces >> pieces: aCollectionOfPieces [
	
]
