Class {
	#name : #BrExpander,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrExpandable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrExpandable classTrait',
	#instVars : [
		'accordionModel'
	],
	#category : #'Brick-Expander - UI'
}

{ #category : #accessing }
BrExpander >> content: aStencil [
	accordionModel contentStencil: aStencil
]

{ #category : #accessing }
BrExpander >> header: aStencil [
	accordionModel headerStencil: aStencil
]

{ #category : #initialization }
BrExpander >> initialize [
	super initialize.
	
	self viewModel: (accordionModel := BrAccordionModel new)
]
