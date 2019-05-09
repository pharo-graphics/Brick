Class {
	#name : #BrGlamorousLabelLook,
	#superclass : #BrGlamorousTextLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousLabelLook >> initialize [
	super initialize.

	labelElement padding: (BlInsets all: 1).
	self add: BrLayoutResizerLook new inherit.

	changes add: (#(widget layout) asBrLookPropertyChangeWithValue: [ BlLinearLayout vertical alignCenterLeft ])
]
