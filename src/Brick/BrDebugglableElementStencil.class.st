Class {
	#name : #BrDebugglableElementStencil,
	#superclass : #BrStencil,
	#instVars : [
		'exception'
	],
	#category : #'Brick-Exception - Stencil'
}

{ #category : #'api - instantiation' }
BrDebugglableElementStencil >> create [
	<return: #BlElement>
	| aLabel aButton aContainer |
	aLabel := BrButton new
		hMatchParent;
		label: self newTextLabel;
		look: BrGlamorousLabelLook new;
		margin: (BlInsets right: 6);
		constraintsDo: [ :c | 
			c linear vertical alignCenter ];
		action: self newDebugAction.
	aButton := BrButton new
		hFitContent;
		look: BrGlamorousButtonWithIconLook new;
		icon: BrGlamorousIcons debug;
		beTiny;
		constraintsDo: [ :c | 
			c linear vertical alignCenter ];
		action: self newDebugAction.
	aContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContentLimited.
			c vertical fitContent.
			c frame horizontal alignCenter.
			c frame vertical alignCenter ];
		addChildren: {aLabel. aButton}.
	^ BrFrame new
		matchParent;
		addChild: aContainer
]

{ #category : #accessing }
BrDebugglableElementStencil >> exception [
	^ exception
]

{ #category : #accessing }
BrDebugglableElementStencil >> exception: anException [
	exception := anException
]

{ #category : #accessing }
BrDebugglableElementStencil >> freeze: anException [
	anException freeze.
	self exception: anException
]

{ #category : #'instance creation' }
BrDebugglableElementStencil >> newDebugAction [
	^ [ 
		[
			UIManager default
				gtDebugProcess: Processor activeProcess   
				context: self exception signalerContext 
				label: self exception description  
				fullView: true
				notification: nil
		] forkNamed: 'Debug' ].
]

{ #category : #'instance creation' }
BrDebugglableElementStencil >> newTextLabel [
	^ self exception printString asRopedText 
		glamorousCodeFontAndSmallSize;
		foreground: BrGlamorousColors linkWithErrorColor
]
