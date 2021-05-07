Class {
	#name : #BrGlamorousBadgeCircularAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeCircularAptitude >> initialize [
	super initialize.

	self default: [ :aStyle | aStyle geometry: BlEllipseGeometry new ].
	self expanded: [ :aStyle | aStyle geometry: BlRectangleGeometry new ]
]
