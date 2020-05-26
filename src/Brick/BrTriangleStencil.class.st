Class {
	#name : #BrTriangleStencil,
	#superclass : #BrStencil,
	#instVars : [
		'backgroundColor'
	],
	#category : #'Brick-Triangle - Stencil'
}

{ #category : #accessing }
BrTriangleStencil >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
BrTriangleStencil >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #'api - instantiation' }
BrTriangleStencil >> create [
	<return: #BlElement>

	^ BlElement new
		size: 8@8;
		background: self backgroundColor.
]

{ #category : #defaults }
BrTriangleStencil >> defaultBackgroundColor [
	^ Color gray
]

{ #category : #initialization }
BrTriangleStencil >> initialize [
	super initialize.
	backgroundColor := self defaultBackgroundColor.
]
