Class {
	#name : #BrSideNavigation,
	#superclass : #BrPane,
	#instVars : [
		'menu'
	],
	#category : 'Brick-Experimental-SidePane'
}

{ #category : #'as yet unclassified' }
BrSideNavigation >> close [
|animPos animColor|
	animPos := BlNumberTransition new
		from: 0@0;
		to:-300@0;
		duration:200;
		onStepDo:[:v| menu relocate: v  ].
		
	animColor := BlColorTransition new
		from:(Color black alpha:0.3);
		to:(Color black alpha:0);
		duration:200;
		onStepDo:[:v| self background: v  ];
		onFinishedDo:[self visibility: BlVisibility hidden].
	
	BlParallelAnimation new
		add: animPos;
		add: animColor;
		start
	 
]

{ #category : #'as yet unclassified' }
BrSideNavigation >> initialize [
	super initialize.
	self
		constraintsDo: [ :c |  
			c horizontal matchParent.
			c vertical matchParent.
			c frame vertical alignTop.
			c frame horizontal alignLeft ];
		background: (Color black alpha: 0.3);
		zIndex: 1000;
		visibility: BlVisibility hidden;
		addEventHandler: (BrOnClickHandler do:[self close]).
		
	menu := BrPane new
		width: 300;
		background: Color white;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c frame vertical alignTop.
			c frame horizontal alignLeft  ];
		effect:
			(BlDropShadowEffect new
				offset: 0.5 @ 0;
				width: 3;
				color: (Color black alpha: 0.5)).
	self addChild: menu
]

{ #category : #'as yet unclassified' }
BrSideNavigation >> menuDo: aBlock [
	aBlock value: menu
]

{ #category : #'as yet unclassified' }
BrSideNavigation >> open [
	| animPos animColor |
	animPos := BlNumberTransition new
		from: -300 @ 0;
		to: 0 @ 0;
		duration: 200;
		onStepDo: [ :v | menu relocate: v ].
		
	animColor := BlColorTransition new
		from: (Color black alpha: 0);
		to: (Color black alpha: 0.3);
		duration: 200;
		onStepDo: [ :v | self background: v ].
	BlParallelAnimation new
		add: animPos;
		add: animColor;
		start.
	self visibility: BlVisibility visible
]
