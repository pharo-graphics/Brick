Class {
	#name : #BrAccordionModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'contentStencil',
		'headerStencil'
	],
	#category : #'Brick-Accordion - Model'
}

{ #category : #'api - accessing' }
BrAccordionModel >> contentStencil [
	<return: #BrStencil>

	^ contentStencil
]

{ #category : #'api - accessing' }
BrAccordionModel >> contentStencil: aBrStencil [
	contentStencil := aBrStencil asStencil.
	self notifyContentStencilChanged
]

{ #category : #'api - accessing' }
BrAccordionModel >> headerStencil [
	<return: #BrStencil>

	^ headerStencil
]

{ #category : #'api - accessing' }
BrAccordionModel >> headerStencil: aBrStencil [
	headerStencil := aBrStencil asStencil.
	self notifyHeaderStencilChanged
]

{ #category : #initialization }
BrAccordionModel >> initialize [
	super initialize.
	
	contentStencil := [ BlElement new
		size: 50@50;
		background: Color red;
		yourself ] asStencil.
		
	headerStencil := [ BlElement new
		size: 50@50;
		background: Color blue;
		yourself ] asStencil
]

{ #category : #initialization }
BrAccordionModel >> initializeListeners [
	super initializeListeners.

	self when: BrAccordionContentStencilRequest reply: [ :aResponse | aResponse stencil: self contentStencil ].
	self when: BrAccordionHeaderStencilRequest reply: [ :aResponse | aResponse stencil: self headerStencil ]
]

{ #category : #notifying }
BrAccordionModel >> notifyContentStencilChanged [
	self dispatchEvent: (BrAccordionContentStencilChanged stencil: self contentStencil)
]

{ #category : #notifying }
BrAccordionModel >> notifyHeaderStencilChanged [
	self dispatchEvent: (BrAccordionHeaderStencilChanged stencil: self headerStencil)
]
