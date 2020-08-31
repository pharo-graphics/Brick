"
I special type of a segment piece that creates an element based on adornment attribute.

I am created by BrTextEditorAttributedLineSegment - a segment that supports adornment attributes
"
Class {
	#name : #BrTextEditorLineSegmentAdornmentPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#instVars : [
		'adornmentAttribute',
		'isVirtual'
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
	| theAdornmentElements |

	theAdornmentElements := (self adornmentAttribute affect: self in: anEditorElement) asOrderedCollection.
	theAdornmentElements ifEmpty: [
		theAdornmentElements := OrderedCollection with: (BlElement new size: 0@0) ]. 
	theAdornmentElements do: [ :eachElement |
		eachElement mouseCursor ifNil: [ eachElement mouseCursor: BlCursor default ].
		eachElement focusability: BlFocusabilityNone new ].
	
	theAdornmentElements withIndexDo: [ :eachAdornmentElement :eachIndex |
		| aCharLength |
		
		aCharLength := self isVirtual
			ifTrue: [ 0 ]
			ifFalse: [ eachIndex = theAdornmentElements size
				ifTrue: [ self textLength ]
				ifFalse: [ 0 ] ].
		
		eachAdornmentElement userData at: #brickEditorCharLength put: aCharLength.
		eachAdornmentElement userData at: #brickEditorTextPiece put: self ].
	
	^ theAdornmentElements
]

{ #category : #comparing }
BrTextEditorLineSegmentAdornmentPiece >> hash [
	^ (self class hash bitXor: self text hash) bitXor: self adornmentAttribute hash
]

{ #category : #initialization }
BrTextEditorLineSegmentAdornmentPiece >> initialize [
	super initialize.

	"means I do not count for representing an actual text"
	isVirtual := true
]

{ #category : #accessing }
BrTextEditorLineSegmentAdornmentPiece >> isVirtual [
	^ isVirtual
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentAdornmentPiece >> screenToCursor: aTransformation of: anEditorElement in: aPieceElement [
	super screenToCursor: aTransformation of: anEditorElement in: aPieceElement.
	
	aTransformation hasResult
		ifFalse: [ aTransformation transformed: self textEnd ]
]

{ #category : #accessing }
BrTextEditorLineSegmentAdornmentPiece >> virtual: aBoolean [
	isVirtual := aBoolean
]
