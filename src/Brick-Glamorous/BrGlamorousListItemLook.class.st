Class {
	#name : #BrGlamorousListItemLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #initialization }
BrGlamorousListItemLook >> initialize [
	super initialize.

	self
			default: [ :aWidget | aWidget background: BrGlamorousColors defaultListItemColor ];
			hovered: [ :aWidget | aWidget background: BrGlamorousColors hoveredListItemColor ];
			selected: [ :aWidget | aWidget background: BrGlamorousColors selectedListItemColor ];
			pressed: [ :aWidget | aWidget background: BrGlamorousColors pressedListItemColor ];
			focused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedListItemBorder width: 1) ].
]
