Class {
	#name : #BrListClickableRowStencilBuilder,
	#superclass : #BrColumnedListRowStencilBuilder,
	#category : 'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrListClickableRowStencilBuilder >> buildDefault [
	| aList anIndex |
	aList := self listElement.
	anIndex := self rowIndex.
	^ BlElement new
		layout: BlLinearLayout horizontal alignCenterLeft;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		when: BlClickEvent
			do: [ :anEvent | 
			anEvent consumed: true.
			aList selectOne: anIndex dueTo: anEvent ];
		when: BlDoubleClickEvent
			do: [ :anEvent |
			anEvent consumed: true.
			aList dispatchEvent: (BrSelectionDoubleClicked new selection: aList selection; sourceEvent: anEvent) ]
]
