Class {
	#name : #BrGlamorousButtonWithLabelTooltipLook,
	#superclass : #BrGlamorousWithTooltipLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipLook >> initializeListeners [
	super initializeListeners.
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipLook >> initializeRequests [
	super initializeRequests.
	self request: BrLabelRequest new
]

{ #category : #accessing }
BrGlamorousButtonWithLabelTooltipLook >> text: aTextOrString [
	self
		stencil: [ BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent.
					c linear vertical alignCenter ];
				padding: (BlInsets all: 5);
				addChild:
					(BrLabel new
						look: BrGlamorousLabelLook;
						text: aTextOrString;
						yourself);
				addChild:
					(BrButton new
						beSmall;
						look: BrGlamorousButtonWithIconLook;
						icon: BrGlamorousIcons inspect;
						label: 'Inspect action';
						action: [ widget phlow spawnObject: widget action ];
						margin: (BlInsets left: 5);
						yourself);
				yourself ]
]
