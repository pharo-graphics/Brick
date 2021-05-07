Class {
	#name : #BrGlamorousTriangleInCircleAptitude,
	#superclass : #BrTriangleAptitude,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #initialization }
BrGlamorousTriangleInCircleAptitude >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widget layout) 
			with: [ BlFrameLayout new ]; 
		addChangeProperty: #(widget geometry)
			with: [ BlEllipseGeometry new ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer exact: 16.0 ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer exact: 16.0 ].

	self add: (BrStyleCommonAptitude new
		default: [ :aStyle | aStyle background: BrGlamorousColors deselectedListItemColor ];
		hovered: [ :aStyle | aStyle background: BrGlamorousColors hoveredListItemColor ];
		pressed: [ :aStyle | aStyle background: BrGlamorousColors pressedListItemColor ]).
	
	self add: (BrSizeAdjustmentAptitude new
		huge: [ :aStyle | 
			aStyle 
				padding: (BlInsets all: 2);
				scaleBy: 1.5 ];
		large: [ :aStyle | 
			aStyle 
				padding: (BlInsets all: 2);
				scaleBy: 1.25 ];
		normal: [ :aStyle | 
			aStyle 
				padding: (BlInsets all: 2);
				scaleBy: 1 ];
		small: [ :aStyle | 
			aStyle 
				padding: (BlInsets all: 1);
				scaleBy: 0.91 ];
		tiny: [ :aStyle | 
			aStyle 
				padding: (BlInsets all: 1);
				scaleBy: 0.83 ];
		mini: [ :aStyle | 
			aStyle 
				padding: (BlInsets all: 1);
				scaleBy: 0.75 ])
]

{ #category : #initialization }
BrGlamorousTriangleInCircleAptitude >> initializeTriangle: aTriangle [
	"configure collapsed and expanded triangle elements"

	aTriangle 
		background: BrGlamorousColors expandCollapseTriangleBackgroundColor;
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter. ].
]
