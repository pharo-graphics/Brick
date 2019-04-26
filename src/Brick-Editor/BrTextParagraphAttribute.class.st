"
I am an attribute that is intended to be applied on a multi-line piece of text.

I should be treated differently by text widgets with the support of multi-line text than normal text attributes. One example of a paragraph attribute is line-spacing
"
Class {
	#name : #BrTextParagraphAttribute,
	#superclass : #BlTextAttribute,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #hook }
BrTextParagraphAttribute >> applyOn: aTextParagraph [
]

{ #category : #testing }
BrTextParagraphAttribute >> isParagraphAttribute [
	"Return true if I am a special paragraph attribute, false otherwise"
	<return: #Boolean>

	^ true
]
