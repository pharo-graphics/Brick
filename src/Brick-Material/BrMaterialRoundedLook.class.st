"
I define a rounded rectangle geometry
"
Class {
	#name : #BrMaterialRoundedLook,
	#superclass : #BrLook,
	#instVars : [
		'cornerRadius'
	],
	#category : #'Brick-Material-! Core'
}

{ #category : #accessing }
BrMaterialRoundedLook >> cornerRadius [
	<return: #Number>

	^ cornerRadius
]

{ #category : #accessing }
BrMaterialRoundedLook >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	self updateCornerRadius
]

{ #category : #initialization }
BrMaterialRoundedLook >> initialize [
	super initialize.
	cornerRadius := 2.
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: self cornerRadius ])
]

{ #category : #updating }
BrMaterialRoundedLook >> updateCornerRadius [
	self widgetDo: [ :anElement | anElement geometry: (BlRectangle cornerRadius: self cornerRadius) ]
]
