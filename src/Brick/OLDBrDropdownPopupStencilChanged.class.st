Class {
	#name : #OLDBrDropdownPopupStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Dropdown - Events'
}

{ #category : #'instance creation' }
OLDBrDropdownPopupStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #accessing }
OLDBrDropdownPopupStencilChanged >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #accessing }
OLDBrDropdownPopupStencilChanged >> stencil: aBrStencil [
	stencil := aBrStencil
]
