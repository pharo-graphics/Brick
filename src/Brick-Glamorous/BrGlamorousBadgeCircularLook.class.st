Class {
	#name : #BrGlamorousBadgeCircularLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeCircularLook >> initialize [
	super initialize.

	self default: [ :aWidget | aWidget geometry: BlEllipse new ].
	self expanded: [ :aWidget | aWidget geometry: BlRoundedRectangleGeometry new ]
]
