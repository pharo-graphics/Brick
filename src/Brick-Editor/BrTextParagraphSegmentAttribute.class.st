"
I create a new segment out of text on which I am applied.

Stencil is used to create a segment element for the text
"
Class {
	#name : #BrTextParagraphSegmentAttribute,
	#superclass : #BrTextParagraphAttribute,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextParagraphSegmentAttribute >> affect: aBrText in: anEditorElement [
	"Return a collection of objects (may be empty) that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ { BlElement new size: 200@200 }
]

{ #category : #comparing }
BrTextParagraphSegmentAttribute >> equals: aTextAttribute [
	^ true
]

{ #category : #comparing }
BrTextParagraphSegmentAttribute >> hash [
	^ self class hash
]

{ #category : #testing }
BrTextParagraphSegmentAttribute >> isAdornment [
	"Return true if attribute influences text structure, for examples if it replaces one or more characters
	with any amount of other arbitrary items, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #testing }
BrTextParagraphSegmentAttribute >> isStyle [
	^ false
]

{ #category : #accessing }
BrTextParagraphSegmentAttribute >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTextParagraphSegmentAttribute >> stencil: anObject [
	stencil := anObject
]
