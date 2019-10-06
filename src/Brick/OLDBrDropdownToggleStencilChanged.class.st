Class {
	#name : #OLDBrDropdownToggleStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Dropdown - Events'
}

{ #category : #'instance creation' }
OLDBrDropdownToggleStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #accessing }
OLDBrDropdownToggleStencilChanged >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #accessing }
OLDBrDropdownToggleStencilChanged >> stencil: aBrStencil [
	stencil := aBrStencil
]
