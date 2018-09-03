Class {
	#name : #BrAccordionModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'stencil'
	],
	#category : #'Brick-Accordion - Model'
}

{ #category : #initialization }
BrAccordionModel >> initialize [
	super initialize.
	
	stencil := BlElement new
		size: 50@50;
		background: Color red;
		yourself
]

{ #category : #initialization }
BrAccordionModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrAccordionStencilRequest reply: [ :aResponse | aResponse stencil: self stencil ]
]

{ #category : #notifying }
BrAccordionModel >> notifyStencilChanged [
	self dispatchEvent: (BrAccordionStencilChanged stencil: self stencil)
]

{ #category : #'api - accessing' }
BrAccordionModel >> stencil [
	<return: #BrStencil>

	^ stencil
]

{ #category : #'api - accessing' }
BrAccordionModel >> stencil: aBrStencil [
	stencil := aBrStencil asStencil.
	self notifyStencilChanged
]
