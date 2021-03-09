Class {
	#name : #BrPlusIconStencil,
	#superclass : #BrStencil,
	#instVars : [
		'radius',
		'thickness',
		'angle',
		'color'
	],
	#category : #'Brick-Glamorous'
}

{ #category : #'instance creation' }
BrPlusIconStencil class >> add [
	^ self new
]

{ #category : #'instance creation' }
BrPlusIconStencil class >> close [
	^ self new angle: 45
]

{ #category : #accessing }
BrPlusIconStencil >> angle [
	^ angle
]

{ #category : #accessing }
BrPlusIconStencil >> angle: anObject [
	angle := anObject
]

{ #category : #'api - instantiation' }
BrPlusIconStencil >> color [
	^ color
]

{ #category : #'api - instantiation' }
BrPlusIconStencil >> color: aColor [
	color := aColor
]

{ #category : #'api - instantiation' }
BrPlusIconStencil >> create [
	| aRadius aThickness |
	aRadius := self radius.
	aThickness := self thickness.
	^ BlElement new
		size: (aRadius + aRadius) @ (aRadius + aRadius);
		geometry:
			(BlPolygon
				vertices:
					{((aRadius - aThickness) @ 0).
					((aRadius + aThickness) @ 0).
					((aRadius + aThickness) @ (aRadius - aThickness)).
					((aRadius + aRadius) @ (aRadius - aThickness)).
					((aRadius + aRadius) @ (aRadius + aThickness)).
					((aRadius + aThickness) @ (aRadius + aThickness)).
					((aRadius + aThickness) @ (aRadius + aRadius)).
					((aRadius - aThickness) @ (aRadius + aRadius)).
					((aRadius - aThickness) @ (aRadius + aThickness)).
					(0 @ (aRadius + aThickness)).
					(0 @ (aRadius - aThickness)).
					((aRadius - aThickness) @ (aRadius - aThickness))});
		background: self color;
		transformDo: [ :t | t rotateBy: self angle ]
]

{ #category : #initialization }
BrPlusIconStencil >> initialize [
	super initialize.

	radius := 5.
	thickness := 1.
	angle := 0.
	color := Color gray
]

{ #category : #accessing }
BrPlusIconStencil >> radius [
	^ radius
]

{ #category : #accessing }
BrPlusIconStencil >> radius: anObject [
	radius := anObject
]

{ #category : #accessing }
BrPlusIconStencil >> thickness [
	^ thickness
]

{ #category : #accessing }
BrPlusIconStencil >> thickness: aNumber [
	thickness := aNumber
]
