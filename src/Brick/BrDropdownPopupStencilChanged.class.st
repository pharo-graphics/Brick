Class {
	#name : #BrDropdownPopupStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Dropdown - Events'
}

{ #category : #'instance creation' }
BrDropdownPopupStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #accessing }
BrDropdownPopupStencilChanged >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #accessing }
BrDropdownPopupStencilChanged >> stencil: aBrStencil [
	stencil := aBrStencil
]
