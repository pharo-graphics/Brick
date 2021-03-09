Class {
	#name : #BrGlamorousWithMaximizerLook,
	#superclass : #BrWithMaximizerLook,
	#instVars : [
		'actionButton'
	],
	#category : #'Brick-Glamorous-Maximizer'
}

{ #category : #initialization }
BrGlamorousWithMaximizerLook >> createActionButton [
	^ BrButton new
		background: Color white;
		look: BrIconLook + BrGlamorousFocusableShadowLook + (BrStyleCommonLook new
			default: [ :s | s background: Color white ];
			hovered: [ :s | s background: Color veryVeryLightGray lighter ];
			pressed: [ :s | s background: Color veryVeryLightGray ]);
		geometry: BlEllipseGeometry new;
		layout: BlLinearLayout horizontal alignCenter;
		icon: (BrPlusIconStencil new radius: 4);
		size: 16@16
]

{ #category : #initialization }
BrGlamorousWithMaximizerLook >> initialize [
	super initialize.

	actionButton := self createActionButton.
	actionButton action: [
		isMaximized
			ifTrue: [ self minimize ]
			ifFalse: [ self maximize ] ].

	actionButton constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored horizontal alignCenterAt: 0.
		c ignored vertical alignCenterAt: 0 ].
	actionButton zIndex: 100.

	self addChangeAddChild: #() with: [ actionButton ].
	self addChangeProperty: #(widget clipChildren) with: false
]

{ #category : #'private - hooks' }
BrGlamorousWithMaximizerLook >> onMaximized [
	super onMaximized.

	actionButton visibility: BlVisibility gone
]

{ #category : #'private - hooks' }
BrGlamorousWithMaximizerLook >> onMinimized [
	super onMinimized.

	actionButton visibility: BlVisibility visible
]
