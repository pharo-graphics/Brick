Class {
	#name : #BrGlamorousTriangleInCircleLook,
	#superclass : #BrTriangleLook,
	#category : #'Brick-Glamorous-List, Tree'
}

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
		addChangeProperty: #(widget constraints margin)
			with: [ BlInsets all: 2 ];
		default: [ :aWidget | aWidget background: BrGlamorousColors deselectedtListItemColor ];
		hovered: [ :aWidget | aWidget background: BrGlamorousColors hoveredListItemColor ];
		pressed: [ :aWidget | aWidget background: BrGlamorousColors pressedListItemColor ]
]
