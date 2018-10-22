Class {
	#name : #BrAccordionHeaderStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Accordion - Events'
}

{ #category : #initialization }
BrAccordionHeaderStencilRequest >> responseClass [
	^ BrAccordionHeaderStencilChanged
]
