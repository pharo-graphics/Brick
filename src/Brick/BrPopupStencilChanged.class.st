Class {
	#name : #BrPopupStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'popupStencil'
	],
	#category : #'Brick-Popup - Events'
}

{ #category : #accessing }
BrPopupStencilChanged >> popupStencil [
	^ popupStencil
]

{ #category : #accessing }
BrPopupStencilChanged >> popupStencil: anObject [
	popupStencil := anObject
]
