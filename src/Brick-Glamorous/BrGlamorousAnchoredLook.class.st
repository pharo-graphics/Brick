Class {
	#name : #BrGlamorousAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'background'
	],
	#category : #'Brick-Glamorous-Anchored'
}

{ #category : #accessing }
BrGlamorousAnchoredLook >> background [
	^ background
]

{ #category : #accessing }
BrGlamorousAnchoredLook >> background: aBlBackground [
	background := aBlBackground.
	self widgetDo: [ :aWidget | aWidget background: background ]
]

{ #category : #'instance creation' }
BrGlamorousAnchoredLook >> initialize [
	super initialize.
	
	background := Color white.
	
	self
		add: BrShadowLook new;
		addChangeProperty: #(widget geometry)
			with: [ BrAnchoredGeometry cornerRadius: 4 element: widget ];
		addChangeProperty: #(widget background) with: [ self background ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]
