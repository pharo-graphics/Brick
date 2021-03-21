Class {
	#name : #BrGlamorousBadgeCircularLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeCircularLook >> initialize [
	super initialize.

	self default: [ :aStyle | aStyle geometry: BlEllipseGeometry new ].
	self expanded: [ :aStyle | aStyle geometry: BlRectangleGeometry new ]
]
