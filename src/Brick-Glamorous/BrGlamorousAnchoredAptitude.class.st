Class {
	#name : #BrGlamorousAnchoredAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'background',
		'cornerRadius'
	],
	#category : #'Brick-Glamorous-Anchored'
}

{ #category : #accessing }
BrGlamorousAnchoredAptitude >> background [
	^ background
]

{ #category : #accessing }
BrGlamorousAnchoredAptitude >> background: aBlBackground [
	background := aBlBackground.
	self widgetDo: [ :aWidget | aWidget background: background ]
]

{ #category : #accessing }
BrGlamorousAnchoredAptitude >> cornerRadius [
	<return: #Number>

	^ cornerRadius
]

{ #category : #accessing }
BrGlamorousAnchoredAptitude >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	
	self widgetDo: [ :aWidget | aWidget geometry: (BrAnchoredGeometry cornerRadius: aNumber element: aWidget) ]
]

{ #category : #'instance creation' }
BrGlamorousAnchoredAptitude >> initialize [
	super initialize.
	
	background := Color white.
	cornerRadius := 4.
	
	self
		add: BrShadowAptitude new;
		addChangeProperty: #(widget geometry)
			with: [ BrAnchoredGeometry cornerRadius: self cornerRadius element: widget ];
		addChangeProperty: #(widget background) with: [ self background ];
		addChangeProperty: #(widget border)
			with: [ BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1 ]
]
