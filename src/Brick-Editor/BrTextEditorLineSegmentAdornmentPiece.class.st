"
I special type of a segment piece that creates an element based on adornment attribute.

I am created by BrTextEditorAttributedLineSegment - a segment that supports adornment attributes
"
Class {
	#name : #BrTextEditorLineSegmentAdornmentPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#instVars : [
		'adornmentAttribute'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #comparing }
BrTextEditorLineSegmentAdornmentPiece >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject text = self text
		and: [ anotherObject adornmentAttribute = self adornmentAttribute ]
]

{ #category : #accessing }
BrTextEditorLineSegmentAdornmentPiece >> adornmentAttribute [
	<return: #BrTextAdornmentAttribute>

	^ adornmentAttribute
]

{ #category : #accessing }
BrTextEditorLineSegmentAdornmentPiece >> adornmentAttribute: aBrTextAdornmentAttribute [

	self
		assert: [ aBrTextAdornmentAttribute isNotNil ]
		description: [ 'Adornment attribute must not be nil' ].

	adornmentAttribute := aBrTextAdornmentAttribute
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentAdornmentPiece >> createElement: anEditorElement [
	^ self adornmentAttribute affect: self in: anEditorElement
]

{ #category : #comparing }
BrTextEditorLineSegmentAdornmentPiece >> hash [
	^ (self class hash bitXor: self text hash) bitXor: self adornmentAttribute hash
]
