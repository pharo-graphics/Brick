Class {
	#name : #BrButtonBaseSkin,
	#superclass : #BrLabeledSkin,
	#category : 'Brick-Old'
}

{ #category : #initialization }
BrButtonBaseSkin >> initializeSkin [
	super initializeSkin.

	widget addStyleClass: #button
]
