Class {
	#name : #BrCollapsedTriangleStencil,
	#superclass : #BrTriangleStencil,
	#category : #'Brick-Triangle - Stencil'
}

{ #category : #'api - instantiation' }
BrCollapsedTriangleStencil >> create [
	<return: #BlElement>
	
	^ super create
		geometry: (BlPolygon vertices: { 0@0 . 8@4 . 0@8 })
]
