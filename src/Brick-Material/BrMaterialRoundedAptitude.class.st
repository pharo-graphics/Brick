"
I define a rounded rectangle geometry
"
Class {
	#name : #BrMaterialRoundedAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'cornerRadius'
	],
	#category : #'Brick-Material-! Core'
}

{ #category : #accessing }
BrMaterialRoundedAptitude >> cornerRadius [
	<return: #Number>

	^ cornerRadius
]

{ #category : #accessing }
BrMaterialRoundedAptitude >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	self updateCornerRadius
]

{ #category : #initialization }
BrMaterialRoundedAptitude >> initialize [
	super initialize.
	cornerRadius := 2.
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRoundedRectangleGeometry cornerRadius: self cornerRadius ]
]

{ #category : #updating }
BrMaterialRoundedAptitude >> updateCornerRadius [
	self widgetDo: [ :anElement | anElement geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius) ]
]
