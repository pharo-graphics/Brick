Class {
	#name : #BrAccordionContentStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Accordion - Events'
}

{ #category : #initialization }
BrAccordionContentStencilRequest >> responseClass [
	^ BrAccordionContentStencilChanged
]
