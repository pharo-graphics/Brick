Class {
	#name : #BrDropdownOutskirtsEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'element'
	],
	#category : #'Brick-Dropdown - Stencils'
}

{ #category : #'api - instantiation' }
BrDropdownOutskirtsEmbellisher >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ self element
]

{ #category : #accessing }
BrDropdownOutskirtsEmbellisher >> element [
	^ element
]

{ #category : #accessing }
BrDropdownOutskirtsEmbellisher >> element: anObject [
	element := anObject
]

{ #category : #'api - instantiation' }
BrDropdownOutskirtsEmbellisher >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self element
]
