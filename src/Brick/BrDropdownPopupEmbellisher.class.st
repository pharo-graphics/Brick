Class {
	#name : #BrDropdownPopupEmbellisher,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'toggleStencil',
		'popupElement'
	],
	#category : #'Brick-Dropdown - Stencils'
}

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> buildDefault [
	| aContainer |
	<return: #Object>
	
	aContainer := BlElement new.
	aContainer background: Color white.
	aContainer look: BrShadowLook new.
	aContainer layout: BlLinearLayout vertical.
	aContainer constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
	aContainer addChild: (self toggleStencil asElement) as: #toggle.
	aContainer addChild: self popupElement as: #popup. 

	^ aContainer
]

{ #category : #'api - instantiation' }
BrDropdownPopupEmbellisher >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self popupElement;
		push: self toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> popupElement [
	^ popupElement
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> popupElement: anObject [
	popupElement := anObject
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil [
	^ toggleStencil
]

{ #category : #accessing }
BrDropdownPopupEmbellisher >> toggleStencil: anObject [
	toggleStencil := anObject
]
