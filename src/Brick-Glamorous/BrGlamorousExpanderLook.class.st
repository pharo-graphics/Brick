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
	| aTriangle aShadowLook |
	super initialize.
	aShadowLook := BrShadowLook new.
	aTriangle := BlElement new
		size: 8 @ 8;
		background: (Color white alpha: 0.9);
		constraintsDo: [ :c | c linear vertical alignCenter ].
	toggle := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 4);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		background: Color veryVeryLightGray;
		addChild: aTriangle;
		"ask expandable model to toggle itself"
			when: BlClickEvent
			do: [ self dispatchEvent: BrExpansionToggleWish new ].
	sidebar := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent ];
		background: Color veryVeryLightGray;
		addChild: toggle.
	container := BlElement new
		padding: (BlInsets all: 10);
		layout: BlLinearLayout vertical.
	self
		add:
			(BrInteractiveCommonLook new
				collapsed: [ :aWidget | 
					"triangle pointing right"
					aTriangle
						geometry:
							(BlPolygon
								vertices:
									{(0 @ 0).
									(8 @ 4).
									(0 @ 8)}).
					aWidget background: Color transparent.
					aWidget
						border: (BlBorder paint: Color veryVeryLightGray width: 1).
					self remove: aShadowLook ];
				expanded: [ :aWidget | 
					"triangle pointing down"
					aTriangle
						geometry:
							(BlPolygon
								vertices:
									{(0 @ 0).
									(8 @ 0).
									(4 @ 8)}).
					aWidget background: Color white.
					aWidget border: BlBorder empty.
					self remove: aShadowLook.
					self add: aShadowLook ]).
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
