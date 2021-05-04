Class {
	#name : #BrAccordionAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'contentElement',
		'contentStencil',
		'headerStencil',
		'headerElement'
	],
	#category : #'Brick-Accordion - Look'
}

{ #category : #hooks }
BrAccordionAptitude >> accordionCollapsed [
	contentElement ifNotNil: [ contentElement removeFromParent ]
]

{ #category : #hooks }
BrAccordionAptitude >> accordionExpanded [

	contentElement ifNil: [ contentElement := self contentStencil asElement ].
	contentElement removeFromParent.
	self widgetContent addChild: contentElement
]

{ #category : #accessing }
BrAccordionAptitude >> contentStencil [
	 ^ contentStencil
]

{ #category : #accessing }
BrAccordionAptitude >> contentStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	contentStencil := aBrStencil asStencil.

	contentElement ifNotNil: [ contentElement removeFromParent ].
	contentElement := nil.
	self request: BrExpansionStateRequest new
]

{ #category : #accessing }
BrAccordionAptitude >> headerStencil [
	 ^ headerStencil
]

{ #category : #accessing }
BrAccordionAptitude >> headerStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	headerStencil := aBrStencil asStencil.

	headerElement ifNotNil: [ headerElement removeFromParent ].
	headerElement := headerStencil asElement.
	self widgetHeader addChild: headerElement
]

{ #category : #initialization }
BrAccordionAptitude >> initialize [
	super initialize.
	
	contentStencil := BlElement new.
	headerStencil := BlElement new
]

{ #category : #initialization }
BrAccordionAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrExpandedEvent do: [ :anEvent | self accordionExpanded ].
	self when: BrCollapsedEvent do: [ :anEvent | self accordionCollapsed ].
	self when: BrAccordionContentStencilChanged do: [ :anEvent | self contentStencil: anEvent stencil ].
	self when: BrAccordionHeaderStencilChanged do: [ :anEvent | self headerStencil: anEvent stencil ]
]

{ #category : #initialization }
BrAccordionAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrAccordionContentStencilRequest new.
	self request: BrAccordionHeaderStencilRequest new.
	self request: BrExpansionStateRequest new
]

{ #category : #accessing }
BrAccordionAptitude >> widgetHeader [
	"Return widget's header container element"
	<return: #BlElement>

	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].

	"if widget does not have explicit #header container, we treat widget as a container itself"
	^ widget
		childNamed: #header
		ifFound: [ :anElement | anElement ]
		ifNone: [ widget ]
]
