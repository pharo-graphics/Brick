Class {
	#name : #BrGlamorousButtonExteriorLook,
	#superclass : #BrStyleCommonLook,
	#instVars : [
		'backgroundPaint',
		'borderWidth',
		'borderPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> backgroundPaint: aPaint [
	backgroundPaint := aPaint.
	
	self default
		background: self backgroundPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> borderPaint [
	^ borderPaint
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> borderPaint: aColor [
	borderPaint := aColor.
	
	self default
		border: (BlBorder paint: self borderPaint width: self borderWidth)
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> borderWidth [
	^ borderWidth
]

{ #category : #accessing }
BrGlamorousButtonExteriorLook >> borderWidth: anInteger [
	borderWidth := anInteger
]

{ #category : #initialization }
BrGlamorousButtonExteriorLook >> initialize [
	super initialize.
	
	backgroundPaint := BrGlamorousColors defaultButtonBackgroundColor.
	borderPaint := BrGlamorousColors defaultButtonBorderColor.
	borderWidth := 1.

	self default
		background: self backgroundPaint;
		border: (BlBorder paint: self borderPaint width: self borderWidth).

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
