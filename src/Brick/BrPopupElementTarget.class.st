"
I open a popup in a given UI element
"
Class {
	#name : #BrPopupElementTarget,
	#superclass : #BrPopupTarget,
	#instVars : [
		'element'
	],
	#category : #'Brick-Popup - Model'
}

{ #category : #'api - popup' }
BrPopupElementTarget >> closePopup: aPopupElement [
	aPopupElement removeFromParent
]

{ #category : #accessing }
BrPopupElementTarget >> element [
	^ element
]

{ #category : #accessing }
BrPopupElementTarget >> element: anObject [
	element := anObject
]

{ #category : #'api - popup' }
BrPopupElementTarget >> openPopup: aPopupElement [
	self element addChild: aPopupElement
]
