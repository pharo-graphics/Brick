"
I special type of a segment piece that creates an element based on adornment attribute.

I am created by BrTextEditorAttributedLineSegment - a segment that supports adornment attributes
"
Class {
	#name : #BrTextEditorAttributedLineSegmentAdornmentPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#instVars : [
		'adornmentAttribute'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #accessing }
BrTextEditorAttributedLineSegmentAdornmentPiece >> adornmentAttribute [
	<return: #BrTextAdornmentAttribute>

	^ adornmentAttribute
]

{ #category : #accessing }
BrTextEditorAttributedLineSegmentAdornmentPiece >> adornmentAttribute: aBrTextAdornmentAttribute [

	self
		assert: [ aBrTextAdornmentAttribute isNotNil ]
		description: [ 'Adornment attribute must not be nil' ].

	adornmentAttribute := aBrTextAdornmentAttribute
]

{ #category : #'instance creation' }
BrTextEditorAttributedLineSegmentAdornmentPiece >> createElement: anEditorElement [
	^ self adornmentAttribute affect: self text in: anEditorElement
]

{ #category : #accessing }
BrTextEditorAttributedLineSegmentAdornmentPiece >> start: aStartIndex end: anEndIndex [
	"Appended pieces must not modify original text"
	self adornmentAttribute shouldAppend
		ifTrue: [ ^ self ].

	super start: aStartIndex end: anEndIndex
]

{ #category : #updating }
BrTextEditorAttributedLineSegmentAdornmentPiece >> updateCursor: aTextElement of: aLineSegment in: anEditorElement [
	"Adornment pieces do not react on cursor"
]

{ #category : #updating }
BrTextEditorAttributedLineSegmentAdornmentPiece >> updateFocus: aBoolean of: aTextPieceElement in: anEditorElement [
	"Adornment pieces do not react on focus"
]

{ #category : #updating }
BrTextEditorAttributedLineSegmentAdornmentPiece >> updateSelection: anElement of: aLineSegment in: anEditorElement [
	"Adornment pieces do not react on selection"
]

{ #category : #updating }
BrTextEditorAttributedLineSegmentAdornmentPiece >> updateText: anElement of: aLineSegment in: anEditorElement [
	"Adornment pieces do not react on selection"
]
