"
I am an example of a custom Stencil that creates a rounded rectangular element with cusomizable background color and corner radius
"
Class {
	#name : #BrExampleColoredElementStencil,
	#superclass : #BrStencil,
	#instVars : [
		'color',
		'cornerRadius'
	],
	#category : #'Brick-Examples-Stencils'
}

{ #category : #accessing }
BrExampleColoredElementStencil >> color [
	^ color
]

{ #category : #accessing }
BrExampleColoredElementStencil >> color: anObject [
	color := anObject
]

{ #category : #accessing }
BrExampleColoredElementStencil >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrExampleColoredElementStencil >> cornerRadius: anObject [
	cornerRadius := anObject
]

{ #category : #'api - instantiation' }
BrExampleColoredElementStencil >> create [
	^ BlElement new
		size: 300@300;
		background: self color;
		geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius)
]

{ #category : #initialization }
BrExampleColoredElementStencil >> initialize [
	super initialize.
	
	color := Color gray.
	cornerRadius := 20
]
