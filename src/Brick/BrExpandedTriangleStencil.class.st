Class {
	#name : #BrExpandedTriangleStencil,
	#superclass : #BrTriangleStencil,
	#category : #'Brick-Triangle - Stencil'
}

{ #category : #'api - instantiation' }
BrExpandedTriangleStencil >> create [
	<return: #BlElement>
	
	^ super create
		geometry: (BlPolygon vertices: { 0@0 . 8@0 . 4@8 })
]
