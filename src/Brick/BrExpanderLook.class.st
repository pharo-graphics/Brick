Class {
	#name : #BrExpanderLook,
	#superclass : #BrLook,
	#instVars : [
		'contentStencil',
		'headerStencil',
		'contentElement',
		'headerElement',
		'layoutResizerLook'
	],
	#category : #'Brick-Expander - Look'
}

{ #category : #accessing }
BrExpanderLook >> contentStencil [
	 ^ contentStencil
]

{ #category : #accessing }
BrExpanderLook >> contentStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	contentStencil := aBrStencil asStencil.
	contentElement ifNotNil: #removeFromParent.
	contentElement := nil.

	(self request: BrExpansionStateRequest oneWay) isExpanded
		ifTrue: [ self onExpanded ]
		ifFalse: [ self onCollapsed ]
]

{ #category : #accessing }
BrExpanderLook >> currentElementDo: aBlock [
	"Evaluate a given block with header or content if they are initialized"
	
	headerElement ifNotNil: aBlock.
	contentElement ifNotNil: aBlock
]

{ #category : #accessing }
BrExpanderLook >> headerStencil [
	 ^ headerStencil
]

{ #category : #accessing }
BrExpanderLook >> headerStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	headerStencil := aBrStencil asStencil.
	headerElement ifNotNil: #removeFromParent.
	headerElement := nil.

	(self request: BrExpansionStateRequest oneWay) isExpanded
		ifTrue: [ self onExpanded ]
		ifFalse: [ self onCollapsed ]
]

{ #category : #initialization }
BrExpanderLook >> initialize [
	super initialize.
	
	contentStencil := [ BlElement new ] asStencil.
	headerStencil := [ BlElement new ] asStencil.

	self add: (BrInteractiveCommonLook new
		expanded: [ self onExpanded ];
		collapsed: [ self onCollapsed ]).

	self add: (layoutResizerLook := BrInteractiveLayoutResizerLook new
		inherit; "for myself"
		hMatchParentIn: [ :aBlock | self currentElementDo: aBlock ];
		vMatchParentIn: [ :aBlock | self currentElementDo: aBlock ];
		hFitContentIn: [ :aBlock | self currentElementDo: aBlock ];
		vFitContentIn: [ :aBlock | self currentElementDo: aBlock ];
		hExactToMatchParentIn: [ :aBlock | self currentElementDo: aBlock ];
		vExactToMatchParentIn: [ :aBlock | self currentElementDo: aBlock ])
]

{ #category : #initialization }
BrExpanderLook >> initializeContentElement [
	contentElement := self contentStencil asElement.
	contentElement removeFromParent.
	layoutResizerLook requestStates
]

{ #category : #initialization }
BrExpanderLook >> initializeHeaderElement [
	headerElement := self headerStencil asElement.
	headerElement removeFromParent.
	layoutResizerLook requestStates
]

{ #category : #initialization }
BrExpanderLook >> initializeListeners [
	super initializeListeners.

	self when: BrAccordionContentStencilChanged do: [ :anEvent | self contentStencil: anEvent stencil ].
	self when: BrAccordionHeaderStencilChanged do: [ :anEvent | self headerStencil: anEvent stencil ]
]

{ #category : #initialization }
BrExpanderLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrAccordionContentStencilRequest new.
	self request: BrAccordionHeaderStencilRequest new
]

{ #category : #hooks }
BrExpanderLook >> onCollapsed [
	contentElement ifNotNil: #removeFromParent.
	
	headerElement ifNil: [ self initializeHeaderElement ].
	headerElement hasParent
		ifFalse: [ self widgetContent addChild: headerElement ]
]

{ #category : #hooks }
BrExpanderLook >> onExpanded [
	headerElement ifNotNil: #removeFromParent.
	
	contentElement ifNil: [ self initializeContentElement ].
	contentElement hasParent
		ifFalse: [ self widgetContent addChild: contentElement ]
]
