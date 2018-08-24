Class {
	#name : #BrToolbarItemContentChanged,
	#superclass : #BlEvent,
	#instVars : [
		'stencil'
	],
	#category : 'Brick-Toolbar - Events'
}

{ #category : #accessing }
BrToolbarItemContentChanged >> stencil [ 
	<return: #BrStencilBuilder>
	^ stencil
]

{ #category : #accessing }
BrToolbarItemContentChanged >> stencil: aBrStencilBuilder [
	self
		assert: [ aBrStencilBuilder notNil ]
		description: [ 'Content stencil builder must be non-nil' ].

	stencil := aBrStencilBuilder
]
