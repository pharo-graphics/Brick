Class {
	#name : #BrGlamorousButtonExteriorLook,
	#superclass : #BrLook,
	#instVars : [
		'normalBorderPaint',
		'hoveredBorderPaint'
	],
	#pools : [
		'BrGlamorousColors'
	],
	#category : 'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initialize [
	super initialize.
	
	normalBorderPaint := ButtonBorderColor.
	hoveredBorderPaint := HoveredButtonBorderColor
]

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initializeLook [
	super initializeLook.
	
	self widgetContent border: (BlBorder paint: normalBorderPaint width: 1)
]

{ #category : #'mouse handlers' }
BrGlamorousButtonExteriorLook >> mouseEnterEvent: anEvent [
	super mouseEnterEvent: anEvent.
	
	self widgetContent border: (self widgetContent border copyWithPaint: hoveredBorderPaint)
]

{ #category : #'mouse handlers' }
BrGlamorousButtonExteriorLook >> mouseLeaveEvent: anEvent [
	super mouseLeaveEvent: anEvent.
	
	self widgetContent border: (self widgetContent border copyWithPaint: normalBorderPaint)
]
