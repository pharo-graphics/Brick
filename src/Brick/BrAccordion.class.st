"
children := 5 timesCollect: [ :anIndex |
	| accordion |
	accordion := BrAccordion new.
	accordion look: BrGlamorousAccordionLook new.
	accordion margin: (BlInsets all: 5).
	accordion stencil: [
		(GtDocumenter editorForText: 'Hello world')
			constraintsDo: [ :c | c vertical fitContent ] ].

	header := BrButton new.
	header look: BrGlamorousAccordionHeaderLook new.
	header label: 'Header ', anIndex asString .
	header action: [ accordion toggle ].

	accordion addChildFirst: header.
	accordion ].


container := BlElement new.
container layout: BlLinearLayout vertical.
container padding: (BlInsets all: 10).
container constraintsDo: [ :c |
	c horizontal matchParent.
	c vertical fitContent ].

container addChildren: children.
container
"
Class {
	#name : #BrAccordion,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'accordionModel',
		'expandableModel'
	],
	#category : #'Brick-Accordion - UI'
}

{ #category : #'api - accordion' }
BrAccordion >> collapse [
	expandableModel collapse
]

{ #category : #'api - accordion' }
BrAccordion >> content: aStencil [
	accordionModel contentStencil: aStencil
]

{ #category : #'api - accordion' }
BrAccordion >> expand [
	expandableModel expand
]

{ #category : #'api - accordion' }
BrAccordion >> header: aStencil [
	accordionModel headerStencil: aStencil
]

{ #category : #initialization }
BrAccordion >> initialize [
	super initialize.
	
	self viewModel: (accordionModel := BrAccordionModel new
		addAll: {
			BrInteractiveModel new
				withFocus;
				addStates: {
					expandableModel := BrExpandableModel new.
					BrLayoutHorizontalResizerModel matchParent.
					BrLayoutVerticalResizerModel fitContent } })
]

{ #category : #'api - testing' }
BrAccordion >> isCollapsed [
	^ expandableModel isCollapsed
]

{ #category : #'api - testing' }
BrAccordion >> isExpanded [
	^ expandableModel isExpanded
]

{ #category : #'api - accordion' }
BrAccordion >> toggle [
	expandableModel toggle
]
