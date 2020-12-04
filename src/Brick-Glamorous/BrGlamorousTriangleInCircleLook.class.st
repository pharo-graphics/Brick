Class {
	#name : #BrGlamorousTriangleInCircleLook,
	#superclass : #BrTriangleLook,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #initialization }
BrGlamorousTriangleInCircleLook >> initialize [
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

	self add: (BrStyleCommonLook new
		default: [ :aStyle | aStyle background: BrGlamorousColors deselectedListItemColor ];
		hovered: [ :aStyle | aStyle background: BrGlamorousColors hoveredListItemColor ];
		pressed: [ :aStyle | aStyle background: BrGlamorousColors pressedListItemColor ]).
	
	self add: (BrDeprecatedSizeAdjustmentLook new
		huge: [ :aWidget | 
			aWidget 
				padding: (BlInsets all: 2);
				transformDo: [ :t | t scaleBy: 1.5 ] ];
		large: [ :aWidget | 
			aWidget 
				padding: (BlInsets all: 2);
				transformDo: [ :t | t scaleBy: 1.25 ] ];
		default: [ :aWidget | 
			aWidget 
				padding: (BlInsets all: 2);
				transformDo: [ :t | t scaleBy: 1 ] ];
		small: [ :aWidget | 
			aWidget 
				padding: (BlInsets all: 1);
				transformDo: [ :t | t scaleBy: 0.91 ] ];
		tiny: [ :aWidget | 
			aWidget 
				padding: (BlInsets all: 1);
				transformDo: [ :t | t scaleBy: 0.83 ] ];
		mini: [ :aWidget | 
			aWidget 
				padding: (BlInsets all: 1);
				transformDo: [ :t | t scaleBy: 0.75 ] ])
]

{ #category : #initialization }
BrGlamorousTriangleInCircleLook >> initializeTriangle: aTriangle [
	"configure collapsed and expanded triangle elements"

	aTriangle 
		background: BrGlamorousColors expandCollapseTriangleBackgroundColor;
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter. ].
]
