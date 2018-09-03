Class {
	#name : #BrAccordionStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Accordion - Events'
}

{ #category : #'instance creation' }
BrAccordionStencilChanged class >> stencil: aBrStencil [
	^ self new stencil: aBrStencil
]

{ #category : #initialization }
BrAccordionStencilChanged >> initialize [
	super initialize.
	
	stencil := BlElement new
		size: 50@50;
		background: Color red;
		yourself
]

{ #category : #accessing }
BrAccordionStencilChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
BrAccordionStencilChanged >> stencil: anObject [
	stencil := anObject
]
