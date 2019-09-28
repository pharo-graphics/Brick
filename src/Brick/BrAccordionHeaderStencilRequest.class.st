"
I am sent to the accordion model to receive a response with its current header stencil
"
Class {
	#name : #BrAccordionHeaderStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Accordion - Events'
}

{ #category : #initialization }
BrAccordionHeaderStencilRequest >> responseClass [
	^ BrAccordionHeaderStencilChanged
]
