Class {
	#name : #BrGlamorousScrollbarThumbLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousScrollbarThumbLook >> initialize [
	super initialize.
	
	self default: [ :aWidget |
		aWidget background: (Color black alpha: 0.25).
		aWidget geometry: (BlRectangle cornerRadius: 4) ].

	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aWidget |
			aWidget constraintsDo: [ :c |
				c vertical exact: 8.
				c horizontal matchParent ] ];
		vertical: [ :aWidget |
			aWidget constraintsDo: [ :c |
				c horizontal exact: 8.
				c vertical matchParent ] ])
]
