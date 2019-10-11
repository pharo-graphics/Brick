Class {
	#name : #BrGlamorousButtonWithLabelTooltipLook,
	#superclass : #BrWithTooltipLook,
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
				look:
					(BrGlamorousTooltipLook new
						content:
							(BrLabel new
								look: BrGlamorousLabelLook;
								text: aTextOrString;
								padding: (BlInsets all: 5);
								when: BlClickEvent
									do: [ self widgetDo: [ :e | e phlow spawnObject: e action ] ];
								yourself);
						yourself);
				yourself ]
]
