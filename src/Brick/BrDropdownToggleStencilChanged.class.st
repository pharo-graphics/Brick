Class {
	#name : #BrDropdownToggleStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Dropdown - Events'
}

{ #category : #'instance creation' }
BrDropdownToggleStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #accessing }
BrDropdownToggleStencilChanged >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #accessing }
BrDropdownToggleStencilChanged >> stencil: aBrStencil [
	stencil := aBrStencil
]
