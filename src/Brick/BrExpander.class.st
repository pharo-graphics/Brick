Class {
	#name : #BrExpander,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrExpandable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrExpandable classTrait',
	#category : #'Brick-Expander - UI'
}

{ #category : #accessing }
BrExpander >> content: aStencil [
	self viewModel contentStencil: aStencil
]

{ #category : #accessing }
BrExpander >> header: aStencil [
	self viewModel headerStencil: aStencil
]

{ #category : #initialization }
BrExpander >> initialize [
	super initialize.
	
	self viewModel: BrAccordionModel new.
	self collapse.
]
