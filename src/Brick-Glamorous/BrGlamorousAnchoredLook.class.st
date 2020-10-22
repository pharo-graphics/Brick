Class {
	#name : #BrGlamorousAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'background',
		'cornerRadius'
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

{ #category : #accessing }
BrGlamorousAnchoredLook >> cornerRadius [
	<return: #Number>

	^ cornerRadius
]

{ #category : #accessing }
BrGlamorousAnchoredLook >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	
	self widgetDo: [ :aWidget | aWidget geometry: (BrAnchoredGeometry cornerRadius: aNumber element: aWidget) ]
]

{ #category : #'instance creation' }
BrGlamorousAnchoredLook >> initialize [
	super initialize.
	
	background := Color white.
	cornerRadius := 4.
	
	self
		add: BrShadowLook new;
		addChangeProperty: #(widget geometry)
			with: [ BrAnchoredGeometry cornerRadius: self cornerRadius element: widget ];
		addChangeProperty: #(widget background) with: [ self background ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]
