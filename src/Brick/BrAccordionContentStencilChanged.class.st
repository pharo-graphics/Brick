"
I am sent by accordion model when content stencil changes
"
Class {
	#name : #BrAccordionContentStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Accordion - Events'
}

{ #category : #'instance creation' }
BrAccordionContentStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #initialization }
BrAccordionContentStencilChanged >> initialize [
	super initialize.
	
	stencil := [ BlElement new
		size: 50@50;
		background: Color red;
		yourself ] asStencil
]

{ #category : #accessing }
BrAccordionContentStencilChanged >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #accessing }
BrAccordionContentStencilChanged >> stencil: aBrStencil [
	stencil := aBrStencil
]
