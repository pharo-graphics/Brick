Class {
	#name : #BrTextEditorParagraphSegmentAdornmentPiece,
	#superclass : #BrTextEditorParagraphSegmentPiece,
	#instVars : [
		'adornmentAttribute',
		'isVirtual'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #comparing }
BrTextEditorParagraphSegmentAdornmentPiece >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject text = self text
		and: [ anotherObject adornmentAttribute = self adornmentAttribute ]
]

{ #category : #accessing }
BrTextEditorParagraphSegmentAdornmentPiece >> adornmentAttribute [
	<return: #BrTextAdornmentAttribute>

	^ adornmentAttribute
]

{ #category : #accessing }
BrTextEditorParagraphSegmentAdornmentPiece >> adornmentAttribute: aBrTextAdornmentAttribute [

	self
		assert: [ aBrTextAdornmentAttribute isNotNil ]
		description: [ 'Adornment attribute must not be nil' ].

	adornmentAttribute := aBrTextAdornmentAttribute
]

{ #category : #'instance creation' }
BrTextEditorParagraphSegmentAdornmentPiece >> createElement: anEditorElement [
	| theAdornmentElements |

	theAdornmentElements := (self adornmentAttribute affect: self in: anEditorElement) asOrderedCollection.
	theAdornmentElements ifEmpty: [
		theAdornmentElements := OrderedCollection with: (BlElement new size: 0@0) ]. 
	theAdornmentElements do: [ :eachElement |
		eachElement mouseCursor ifNil: [ eachElement mouseCursor: BlCursor default ].
		eachElement focusability: BlFocusabilityNone new ].
	
	self assert: [ self isVirtual or: [
			"only replacement attribute can be non-virtual"
			self isVirtual not and: [ self adornmentAttribute shouldReplace ] ] ]
		description: [ 'Only replacement attribute can be non-virtual' ].
	
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
BrTextEditorParagraphSegmentAdornmentPiece >> hash [
	^ (self class hash bitXor: self text hash) bitXor: self adornmentAttribute hash
]

{ #category : #initialization }
BrTextEditorParagraphSegmentAdornmentPiece >> initialize [
	super initialize.

	"means I do not count for representing an actual text"
	isVirtual := true
]

{ #category : #accessing }
BrTextEditorParagraphSegmentAdornmentPiece >> isVirtual [
	^ isVirtual
]

{ #category : #accessing }
BrTextEditorParagraphSegmentAdornmentPiece >> virtual: aBoolean [
	self
		assert: [ aBoolean or: [
			"only replacement attribute can be non-virtual"
			aBoolean not and: [ self adornmentAttribute shouldReplace ] ] ]
		description: [ 'Only replacement attribute can be non-virtual' ].

	isVirtual := aBoolean
]
