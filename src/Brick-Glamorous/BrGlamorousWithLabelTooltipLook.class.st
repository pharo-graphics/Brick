Class {
	#name : #BrGlamorousWithLabelTooltipLook,
	#superclass : #BrWithTooltipLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #'instance creation' }
BrGlamorousWithLabelTooltipLook >> newLabelWithText: aTextOrString [
	^ BrLabel new
		look: BrGlamorousLabelLook;
		text: aTextOrString;
		padding: (BlInsets all: 5)
]

{ #category : #accessing }
BrGlamorousWithLabelTooltipLook >> text: aTextOrString [
	self
		stencil: [ BrAnchoredElement new
				look:
					(BrGlamorousTooltipLook new
						content: (self newLabelWithText: aTextOrString);
						yourself);
				yourself ]
]
