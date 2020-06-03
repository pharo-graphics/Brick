Class {
	#name : #BrGlamorousLabelTooltipLook,
	#superclass : #BrWithTooltipLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #'instance creation' }
BrGlamorousLabelTooltipLook >> newLabelWithText: aTextOrString [
	^ BrLabel new
		look: BrGlamorousLabelLook;
		text: aTextOrString;
		padding: (BlInsets all: 5)
]

{ #category : #accessing }
BrGlamorousLabelTooltipLook >> text: aTextOrString [
	self
		stencil: [ BrAnchoredElement new
				look:
					(BrGlamorousTooltipLook new
						content: (self newLabelWithText: aTextOrString);
						yourself);
				yourself ]
]
