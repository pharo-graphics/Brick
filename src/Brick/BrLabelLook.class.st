Class {
	#name : #BrLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Label - Look'
}

{ #category : #initialization }
BrLabelLook >> initialize [
	super initialize.
	self add: BrLayoutResizerLook new inherit.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout vertical alignCenter ]
]
