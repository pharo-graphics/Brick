Class {
	#name : #BrGlamorousTriangleInCircleLook,
	#superclass : #BrTriangleLook,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #defaults }
BrGlamorousTriangleInCircleLook >> defaultTriangleBackgroundColor [ 
	^ BrGlamorousColors expandCollapseTriangleBackgroundColor
]

{ #category : #initialization }
BrGlamorousTriangleInCircleLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget geometry)
			with: [ BlEllipse new ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer exact: 16 ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer exact: 16 ];
		addChangeProperty: #(widget constraints margin)
			with: [ BlInsets all: 2 ].
]

{ #category : #initialization }
BrGlamorousTriangleInCircleLook >> initializeWidget [
	super initializeWidget.
	self
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
