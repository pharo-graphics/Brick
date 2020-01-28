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
	| aRootContainer aInnerContainer |
	aInnerContainer := BrHorizontalPane new
		fitContent;
		constraintsDo: [ :c | 
			c frame vertical alignCenter.
			c frame horizontal alignCenter ];
		addChild: self newDebugLabel;
		addChild: self newDebugButton.
	aRootContainer := BrFrame new matchParent
		addChild: aInnerContainer.
	^ aRootContainer
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
BrDebugglableElementStencil >> newDebugButton [
	^ BrButton new
		icon: BrGlamorousIcons debug;
		label: 'Debug';
		look: BrGlamorousButtonWithIconLook;
		beSmall;
		action: self newDebugAction;
		constraintsDo: [ :c | 
			c linear vertical alignCenter. ]
]

{ #category : #'instance creation' }
BrDebugglableElementStencil >> newDebugLabel [
	^ BlShrinkingTextElement new 
			text: self newTextLabel;
			when: BlClickEvent do: [ :anEvent | self newDebugAction value ];
			clipChildren: true;
			constraintsDo: [ :c | 
				c linear vertical alignCenter.
				c padding: (BlInsets right: 6).
				c horizontal fitContent.
				c vertical fitContent ].
]

{ #category : #'instance creation' }
BrDebugglableElementStencil >> newTextLabel [
	^ self exception printString asRopedText 
		glamorousCodeFontAndSmallSize;
		foreground: BrGlamorousColors linkWithErrorColor
]
