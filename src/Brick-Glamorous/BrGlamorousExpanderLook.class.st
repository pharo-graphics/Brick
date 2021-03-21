Class {
	#name : #BrGlamorousExpanderLook,
	#superclass : #BrExpanderLook,
	#instVars : [
		'sidebar',
		'toggle',
		'container'
	],
	#category : #'Brick-Glamorous-Expander'
}

{ #category : #initialization }
BrGlamorousExpanderLook >> initialize [
	| aShadowLook |
	super initialize.

	aShadowLook := BrShadowLook new.

	toggle := BrTriangle new
		look: BrGlamorousTriangleInCircleLook;
		toggleAction: [ self widget fireEvent: BrExpansionToggleWish new ].

	sidebar := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent ];
		background: Color veryVeryLightGray;
		addChild: toggle.
	container := BlElement new
		padding: (BlInsets all: 10);
		layout: BlLinearLayout horizontal.
		
	self add: (BrStyleCommonLook new
		collapsed: [ :aStyle |
			aStyle border: (BlBorder paint: Color veryVeryLightGray width: 1).];
		expanded: [ :aStyle |
			aStyle background: Color white.
			aStyle do: [ self add: aShadowLook ] after: [ self remove: aShadowLook ] ]).

	self addChangeAddChildAs: #(content) with: [ container ].
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRoundedRectangleGeometry cornerRadius: 3 ].
	self addChangeAddChildAs: #(content sidebar) with: [ sidebar ]
]

{ #category : #accessing }
BrGlamorousExpanderLook >> padding: anInsets [
	container padding: anInsets
]

{ #category : #accessing }
BrGlamorousExpanderLook >> resizableElementsDo: aBlock [
	super resizableElementsDo: aBlock.
	
	aBlock value: container
]
