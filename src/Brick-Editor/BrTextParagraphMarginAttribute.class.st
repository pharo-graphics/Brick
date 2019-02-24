Class {
	#name : #BrTextParagraphMarginAttribute,
	#superclass : #BrTextParagraphAttribute,
	#instVars : [
		'paragraphMargin'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #'instance creation' }
BrTextParagraphMarginAttribute class >> paragraphMargin: anInsets [
	^ self new paragraphMargin: anInsets
]

{ #category : #hook }
BrTextParagraphMarginAttribute >> applyOn: aTextParagraph [
	aTextParagraph paragraphMargin: self paragraphMargin
]

{ #category : #comparing }
BrTextParagraphMarginAttribute >> equals: anAnotherAttribute [
	^ self paragraphMargin = anAnotherAttribute paragraphMargin
]

{ #category : #comparing }
BrTextParagraphMarginAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self paragraphMargin hash
]

{ #category : #initialization }
BrTextParagraphMarginAttribute >> initialize [
	super initialize.

	paragraphMargin := BlInsets empty
]

{ #category : #accessing }
BrTextParagraphMarginAttribute >> paragraphMargin [
	<return: #BlInsets>

	^ paragraphMargin
]

{ #category : #accessing }
BrTextParagraphMarginAttribute >> paragraphMargin: anInsets [
	paragraphMargin := anInsets
]
