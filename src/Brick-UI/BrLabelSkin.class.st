Class {
	#name : #BrLabelSkin,
	#superclass : #BrLabeledSkin,
	#category : 'Brick-UI-Label'
}

{ #category : #initialization }
BrLabelSkin >> initializeSkin [
	super initializeSkin.
	widget addStyleClass: #label
]
