Class {
	#name : #BrTriangleStencilsRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Triangle - Events'
}

{ #category : #initialization }
BrTriangleStencilsRequest >> responseClass [
	^ BrTriangleStencilsChanged
]
