"
I am sent to the accordion model to receive a response with its current content stencil
"
Class {
	#name : #BrAccordionContentStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Accordion - Events'
}

{ #category : #initialization }
BrAccordionContentStencilRequest >> responseClass [
	^ BrAccordionContentStencilChanged
]
