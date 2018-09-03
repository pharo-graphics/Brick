Class {
	#name : #BrAccordionStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Accordion - Events'
}

{ #category : #initialization }
BrAccordionStencilRequest >> responseClass [
	^ BrAccordionStencilChanged
]
