"
I influence a line spacing of a paragraph of text.

Example:
"
Class {
	#name : #BrTextParagraphLineSpacingAttribute,
	#superclass : #BrTextParagraphAttribute,
	#instVars : [
		'lineSpacing'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #'instance creation' }
BrTextParagraphLineSpacingAttribute class >> lineSpacing: aNumber [
	^ self new lineSpacing: aNumber
]

{ #category : #hook }
BrTextParagraphLineSpacingAttribute >> applyOn: aTextParagraph [
	aTextParagraph lineSpacing: self lineSpacing
]

{ #category : #comparing }
BrTextParagraphLineSpacingAttribute >> equals: anAnotherAttribute [
	^ self lineSpacing = anAnotherAttribute lineSpacing
]

{ #category : #comparing }
BrTextParagraphLineSpacingAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self lineSpacing hash
]

{ #category : #initialization }
BrTextParagraphLineSpacingAttribute >> initialize [
	super initialize.
	
	lineSpacing := 0
]

{ #category : #accessing }
BrTextParagraphLineSpacingAttribute >> lineSpacing [
	^ lineSpacing
]

{ #category : #accessing }
BrTextParagraphLineSpacingAttribute >> lineSpacing: aNumber [
	lineSpacing := aNumber
]
