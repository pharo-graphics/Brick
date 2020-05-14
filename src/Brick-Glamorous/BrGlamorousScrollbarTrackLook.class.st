Class {
	#name : #BrGlamorousScrollbarTrackLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousScrollbarTrackLook >> initialize [
	super initialize.
	
	self default: [ :aWidget | aWidget background: (Color black alpha: 0.25) ].

	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aWidget |
			aWidget constraintsDo: [ :c |
				c frame vertical alignCenter.
				c vertical exact: 1.
				c horizontal matchParent ] ];
		vertical: [ :aWidget |
			aWidget constraintsDo: [ :c |
				c frame horizontal alignCenter.
				c horizontal exact: 1.
				c vertical matchParent ] ])
]
