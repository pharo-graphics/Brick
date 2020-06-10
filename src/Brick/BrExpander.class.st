Class {
	#name : #BrExpander,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'expandableModel',
		'accordionModel'
	],
	#category : #'Brick-Expander - UI'
}

{ #category : #'api - expander' }
BrExpander >> collapse [
	expandableModel collapse
]

{ #category : #accessing }
BrExpander >> content: aStencil [
	accordionModel contentStencil: aStencil
]

{ #category : #'api - expander' }
BrExpander >> expand [
	expandableModel expand
]

{ #category : #accessing }
BrExpander >> header: aStencil [
	accordionModel headerStencil: aStencil
]

{ #category : #initialization }
BrExpander >> initialize [
	super initialize.
	
	self viewModel: (accordionModel := BrAccordionModel new
		addAll: {
			BrInteractiveModel new
				withFocus;
				addState: (expandableModel := BrExpandableModel new);
				addState: (BrLayoutHorizontalResizerModel new);
				addState: (BrLayoutVerticalResizerModel new)
		})
]

{ #category : #'api - testing' }
BrExpander >> isCollapsed [
	^ expandableModel isCollapsed
]

{ #category : #'api - testing' }
BrExpander >> isExpanded [
	^ expandableModel isExpanded
]

{ #category : #'api - expander' }
BrExpander >> toggle [
	expandableModel toggle
]
