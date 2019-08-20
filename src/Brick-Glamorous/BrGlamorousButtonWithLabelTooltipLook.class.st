Class {
	#name : #BrGlamorousButtonWithLabelTooltipLook,
	#superclass : #BrGlamorousWithTooltipLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipLook >> initialize [
	super initialize.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ self willHideLater
				ifTrue: [ self cancelHideLater ].
			self visible
				ifTrue: [ self hide ] ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: clickEventHandler ];
				down: [ :e | widget removeEventHandler: clickEventHandler ];
				yourself)
]

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
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				addChild:
					(BrLabel new
						look: BrGlamorousLabelLook;
						text: aTextOrString;
						yourself);
				when: BlClickEvent
					do: [ self widgetDo: [ :e | e phlow spawnObject: e action ] ];
				yourself ]
]
