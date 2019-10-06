Class {
	#name : #OLDBrDropdownOutskirtsEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'element'
	],
	#category : #'Brick-Dropdown - Stencils'
}

{ #category : #'api - instantiation' }
OLDBrDropdownOutskirtsEmbellisher >> buildDefault [
	^ self element
]

{ #category : #accessing }
OLDBrDropdownOutskirtsEmbellisher >> element [
	^ element
]

{ #category : #accessing }
OLDBrDropdownOutskirtsEmbellisher >> element: anObject [
	element := anObject
]

{ #category : #'api - instantiation' }
OLDBrDropdownOutskirtsEmbellisher >> paramsOn: aStencilExecutor [
	aStencilExecutor push: self element
]
