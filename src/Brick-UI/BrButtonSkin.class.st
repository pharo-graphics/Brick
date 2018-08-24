Class {
	#name : #BrButtonSkin,
	#superclass : #BrButtonBaseSkin,
	#instVars : [
		'ripple',
		'rippleAnimation'
	],
	#category : 'Brick-UI-Button'
}

{ #category : #initialization }
BrButtonSkin >> initializeSkin [
	super initializeSkin.
	
	ripple := (BlEllipse diameter: 30) asElement
		styleClass: #ripple;
		managed: false;
		position: 10@10.

	rippleAnimation := (BlTransformAnimation scale: 10@10)
		target: ripple;
		duration: 2.8 seconds;
		yourself
	
	
	
]

{ #category : #'mouse handlers' }
BrButtonSkin >> mouseDownEvent: anEvent [
	ripple scaleTo: 1 @ 1.
	ripple extent: (widget extent max) asPoint.
	ripple position: (widget globalPointToLocal: anEvent position) - (widget extent / 2).
	rippleAnimation isRunning ifTrue: [ rippleAnimation stop ].
	rippleAnimation start.
	super mouseDownEvent: anEvent
]

{ #category : #updating }
BrButtonSkin >> updateChildren [
	super updateChildren.
	widget addChild: ripple
]
