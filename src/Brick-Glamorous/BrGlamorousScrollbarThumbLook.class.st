Class {
	#name : #BrGlamorousScrollbarThumbLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousScrollbarThumbLook >> initialize [
	super initialize.
	
	self default: [ :aWidget |
		aWidget background: (BrGlamorousColors defaultHeaderBackgroundColor).
		aWidget geometry: (BlRoundedRectangleGeometry cornerRadius: 3) ].

	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aWidget |
			aWidget constraintsDo: [ :c |
				c vertical exact: 6.
				c horizontal matchParent ] ];
		vertical: [ :aWidget |
			aWidget constraintsDo: [ :c |
				c horizontal exact: 6.
				c vertical matchParent ] ])
]
