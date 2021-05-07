Class {
	#name : #BrGlamorousSpaceTabActionbarAptitude,
	#superclass : #BrGlamorousTabActionbarAptitude,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousSpaceTabActionbarAptitude >> initialize [
	super initialize.

	actionbarContainer padding: actionbarContainer padding + (BlInsets top: 2).

	self add: (BrStyleCommonAptitude new
		@ actionbarContainer;
		deselected: [ :aStyle | 
			aStyle visibility: BlVisibility hidden ];
		when: [ :aState | aState deselected & aState hovered ]
			style: [ :aStyle | aStyle visibility: BlVisibility visible ];
		selected: [ :aStyle | aStyle visibility: BlVisibility visible ]).
]
