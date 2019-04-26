Class {
	#name : #BrTextParagraphWordPaddingAttribute,
	#superclass : #BrTextParagraphAttribute,
	#instVars : [
		'wordPadding'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #'instance creation' }
BrTextParagraphWordPaddingAttribute class >> wordPadding: aBlInsets [
	^ self new wordPadding: aBlInsets
]

{ #category : #hook }
BrTextParagraphWordPaddingAttribute >> applyOn: aTextParagraph [
	aTextParagraph wordPadding: self wordPadding
]

{ #category : #comparing }
BrTextParagraphWordPaddingAttribute >> equals: anAnotherAttribute [
	^ self wordPadding = anAnotherAttribute wordPadding
]

{ #category : #comparing }
BrTextParagraphWordPaddingAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self wordPadding hash
]

{ #category : #initialization }
BrTextParagraphWordPaddingAttribute >> initialize [
	super initialize.

	wordPadding := BlInsets empty
]

{ #category : #accessing }
BrTextParagraphWordPaddingAttribute >> wordPadding [
	<return: #BlInsets>

	^ wordPadding
]

{ #category : #accessing }
BrTextParagraphWordPaddingAttribute >> wordPadding: aBlInsets [
	wordPadding := aBlInsets
]
