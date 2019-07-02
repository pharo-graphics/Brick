Class {
	#name : #BrGlamorousLabelLook,
	#superclass : #BrGlamorousTextLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousLabelLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook new
		topLeft: [ :aWidget | aWidget layout: BlLinearLayout vertical alignTopLeft ];
		topCenter: [ :aWidget | aWidget layout: BlLinearLayout vertical alignTopCenter ];
		topRight: [ :aWidget | aWidget layout: BlLinearLayout vertical alignTopRight ];
		centerLeft: [ :aWidget | aWidget layout: BlLinearLayout vertical alignCenterLeft ];
		center: [ :aWidget | aWidget layout: BlLinearLayout vertical alignCenter ];
		centerRight: [ :aWidget | aWidget layout: BlLinearLayout vertical alignCenterRight ];
		bottomLeft: [ :aWidget | aWidget layout: BlLinearLayout vertical alignBottomLeft ];
		bottomCenter: [ :aWidget | aWidget layout: BlLinearLayout vertical alignBottomCenter ];
		bottomRight: [ :aWidget | aWidget layout: BlLinearLayout vertical alignBottomRight ]).

	labelElement padding: (BlInsets all: 1).
]
