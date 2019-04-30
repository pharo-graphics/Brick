Class {
	#name : #BrLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Label - Look'
}

{ #category : #initialization }
BrLabelLook >> initialize [
	super initialize.
	self add: BrLayoutResizerLook new inherit.
	changes
		add:
			(#(widget layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout vertical alignCenter ])
]
