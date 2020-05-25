Class {
	#name : #BrGlamorousListItemLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #initialization }
BrGlamorousListItemLook >> initialize [
	super initialize.

	self
			default: [ :aWidget | aWidget background: BrGlamorousColors deselectedtListItemColor ];
			selected: [ :aWidget | aWidget background: BrGlamorousColors selectedListItemColor ];
			pressed: [ :aWidget | aWidget background: BrGlamorousColors pressedListItemColor ];
			focused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedListItemBorder width: 1) ].
]
