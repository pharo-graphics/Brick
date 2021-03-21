Class {
	#name : #BrPopupTargetChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'popupTarget'
	],
	#category : #'Brick-Popup - Events'
}

{ #category : #initialization }
BrPopupTargetChanged >> initialize [
	super initialize.
	
	popupTarget := BrPopupEmptyTarget new
]

{ #category : #accessing }
BrPopupTargetChanged >> popupTarget [
	^ popupTarget
]

{ #category : #accessing }
BrPopupTargetChanged >> popupTarget: anObject [
	popupTarget := anObject
]
