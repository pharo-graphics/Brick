Class {
	#name : #BrLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Label - Look'
}

{ #category : #initialization }
BrLabelLook >> initialize [
	super initialize.

	self add: (BrLayoutResizerLook new inherit)
]

{ #category : #initialization }
BrLabelLook >> initializeLook [
	super initializeLook.

	self widget layout: BlLinearLayout vertical alignCenter
]
