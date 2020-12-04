Class {
	#name : #BrGlamorousListItemLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #initialization }
BrGlamorousListItemLook >> initialize [
	super initialize.

	self
		default: [ :aStyle | aStyle background: BrGlamorousColors deselectedListItemColor ];
		selected: [ :aStyle | aStyle background: BrGlamorousColors selectedListItemColor ];
		pressed: [ :aStyle | aStyle background: BrGlamorousColors pressedListItemColor ];
		focused: [ :aStyle | aStyle border: (BlBorder paint: BrGlamorousColors focusedListItemBorder width: 1) ].
]
