Class {
	#name : #BrGlamorousProgressWithLabelAndBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #initialization }
BrGlamorousProgressWithLabelAndBarLook >> initialize [
	super initialize.
	
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
	self addChangeProperty: #(widget constraints horizontal resizer) with: [ BlLayoutResizer matchParent ].
	self addChangeProperty: #(widget constraints vertical resizer) with: [ BlLayoutResizer fitContent ].
	
	self addAll: {
		BrGlamorousProgressLabelLook new.
		BrGlamorousProgressBarLook new.
	}
]
