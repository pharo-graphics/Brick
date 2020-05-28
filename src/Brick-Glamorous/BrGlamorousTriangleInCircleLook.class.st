Class {
	#name : #BrGlamorousTriangleInCircleLook,
	#superclass : #BrTriangleLook,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #initialization }
BrGlamorousTriangleInCircleLook >> initialize [
	super initialize.
	
	self add: (BrSizeAdjustmentLook new
		huge: [ :aWidget | 
			aWidget 
				margin: (BlInsets all: 2);
				transformDo: [ :t | t scaleBy: 1.5 ] ];
		large: [ :aWidget | 
			aWidget 
				margin: (BlInsets all: 2);
				transformDo: [ :t | t scaleBy: 1.25 ] ];
		default: [ :aWidget | 
			aWidget 
				margin: (BlInsets all: 2);
				transformDo: [ :t | t scaleBy: 1 ] ];
		small: [ :aWidget | 
			aWidget 
				margin: (BlInsets all: 1);
				transformDo: [ :t | t scaleBy: 0.91 ] ];
		tiny: [ :aWidget | 
			aWidget 
				margin: (BlInsets all: 1);
				transformDo: [ :t | t scaleBy: 0.83 ] ];
		mini: [ :aWidget | 
			aWidget 
				margin: (BlInsets all: 1);
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

{ #category : #initialization }
BrGlamorousTriangleInCircleLook >> initializeWidget [
	super initializeWidget.
	self
		addChangeProperty: #(widget layout) 
			with: [ BlFrameLayout new ]; 
		addChangeProperty: #(widget geometry)
			with: [ BlEllipse new ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer exact: 16 ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer exact: 16 ];
		default: [ :aWidget | aWidget background: BrGlamorousColors deselectedtListItemColor ];
		hovered: [ :aWidget | aWidget background: BrGlamorousColors hoveredListItemColor ];
		pressed: [ :aWidget | aWidget background: BrGlamorousColors pressedListItemColor ]
]
