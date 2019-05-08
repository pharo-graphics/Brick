"
I am sent by accordion model when header stencil changes
"
Class {
	#name : #BrAccordionHeaderStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Accordion - Events'
}

{ #category : #'instance creation' }
BrAccordionHeaderStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #initialization }
BrAccordionHeaderStencilChanged >> initialize [
	super initialize.
	
	stencil := [ BlElement new
		size: 50@50;
		background: Color red;
		yourself ] asStencil
]

{ #category : #accessing }
BrAccordionHeaderStencilChanged >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #accessing }
BrAccordionHeaderStencilChanged >> stencil: aBrStencil [
	stencil := aBrStencil
]
