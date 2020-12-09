Class {
	#name : #BrExpander,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrExpandable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrExpandable classTrait',
	#category : #'Brick-Expander - UI'
}

{ #category : #'api - expandable' }
BrExpander >> collapse [
	self states addState: BrCollapsedState uniqueInstance
]

{ #category : #accessing }
BrExpander >> content: aStencil [
	self viewModel contentStencil: aStencil
]

{ #category : #'api - expandable' }
BrExpander >> expand [
	self states addState: BrExpandedState uniqueInstance
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

{ #category : #'api - expandable' }
BrExpander >> isExpanded [
	"Return true if an widget is expanded (has expanded state), false otherwise"
	<return: #Boolean>

	^ self states hasState: BrExpandedState uniqueInstance
]
