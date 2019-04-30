Class {
	#name : #BrAccordionLook,
	#superclass : #BrLook,
	#instVars : [
		'contentElement',
		'contentStencil',
		'headerStencil',
		'headerElement'
	],
	#category : #'Brick-Accordion - Look'
}

{ #category : #hooks }
BrAccordionLook >> accordionCollapsed [
	contentElement ifNotNil: [ contentElement removeFromParent ]
]

{ #category : #hooks }
BrAccordionLook >> accordionExpanded [

	contentElement ifNil: [ contentElement := self contentStencil asElement ].
	contentElement removeFromParent.
	self widgetContent addChild: contentElement
]

{ #category : #accessing }
BrAccordionLook >> contentStencil [
	 ^ contentStencil
]

{ #category : #accessing }
BrAccordionLook >> contentStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	contentStencil := aBrStencil asStencil.

	contentElement ifNotNil: [ contentElement removeFromParent ].
	contentElement := nil.
	self request: BrExpansionStateRequest new
]

{ #category : #accessing }
BrAccordionLook >> headerStencil [
	 ^ headerStencil
]

{ #category : #accessing }
BrAccordionLook >> headerStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	headerStencil := aBrStencil asStencil.

	headerElement ifNotNil: [ headerElement removeFromParent ].
	headerElement := headerStencil asElement.
	self widgetHeader addChild: headerElement
]

{ #category : #initialization }
BrAccordionLook >> initialize [
	super initialize.
	
	contentStencil := BlElement new.
	headerStencil := BlElement new
]

{ #category : #initialization }
BrAccordionLook >> initializeListeners [
	super initializeListeners.

	self when: BrExpansionChanged do: [ :anEvent |
		anEvent isExpanded
			ifTrue: [ self accordionExpanded ]
			ifFalse: [ self accordionCollapsed ] ].
	self when: BrAccordionContentStencilChanged do: [ :anEvent | self contentStencil: anEvent stencil ].
	self when: BrAccordionHeaderStencilChanged do: [ :anEvent | self headerStencil: anEvent stencil ]
]

{ #category : #initialization }
BrAccordionLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrAccordionContentStencilRequest new.
	self request: BrAccordionHeaderStencilRequest new.
	self request: BrExpansionStateRequest new
]

{ #category : #accessing }
BrAccordionLook >> widgetHeader [
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
