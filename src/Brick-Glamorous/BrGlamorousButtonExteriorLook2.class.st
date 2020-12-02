Class {
	#name : #BrGlamorousButtonExteriorLook2,
	#superclass : #BrStyleLook,
	#instVars : [
		'backgroundPaint',
		'borderWidth',
		'borderPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonExteriorLook2 >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook2 >> backgroundPaint: aPaint [
	backgroundPaint := aPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook2 >> borderPaint [
	^ borderPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook2 >> borderPaint: aColor [
	borderPaint := aColor
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook2 >> borderWidth [
	^ borderWidth
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook2 >> borderWidth: anInteger [
	borderWidth := anInteger
]

{ #category : #initialization }
BrGlamorousButtonExteriorLook2 >> initialize [
	super initialize.
	
	backgroundPaint := BrGlamorousColors defaultButtonBackgroundColor.
	borderPaint := BrGlamorousColors defaultButtonBorderColor.
	borderWidth := 1.

	self default
		background: self backgroundPaint;
		border: (BlBorder paint: borderPaint width: self borderWidth).

	self focused
		border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: self borderWidth).
		
	self hovered
		border: (BlBorder paint: BrGlamorousColors hoveredButtonBorderColor width: self borderWidth).

	self pressed
		border: (BlBorder paint: BrGlamorousColors pressedButtonBorderColor width: self borderWidth).
		
	self disabled
		background: BrGlamorousColors disabledButtonBackgroundColor;
		border: (BlBorder paint: BrGlamorousColors disabledButtonBorderColor width: self borderWidth)
]
