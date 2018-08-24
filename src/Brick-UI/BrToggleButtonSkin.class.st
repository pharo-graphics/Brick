Class {
	#name : #BrToggleButtonSkin,
	#superclass : #BrButtonBaseSkin,
	#category : 'Brick-UI-Toggle'
}

{ #category : #'as yet unclassified' }
BrToggleButtonSkin >> initializeSkin [
	super initializeSkin.
	widget addStyleClass: #toggle
]
