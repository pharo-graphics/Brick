Class {
	#name : #BrExpanderLook,
	#superclass : #BrLook,
	#instVars : [
		'contentStencil',
		'headerStencil',
		'contentElement',
		'headerElement',
		'layoutResizerLook',
		'shouldRecreateHeader',
		'shouldReplaceHeader'
	],
	#category : #'Brick-Expander - Look'
}

{ #category : #'protected - adding / removing' }
BrExpanderLook >> addContentElement: anElement [
	self widgetContent addChild: anElement
]

{ #category : #'protected - adding / removing' }
BrExpanderLook >> addHeaderElement: anElement [
	self widgetContent addChild: anElement
]

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

{ #category : #'api - configuration' }
BrExpanderLook >> doNotReplaceHeader [
	"Tell expander to not replace header with the content, but instead just add it"
	
	shouldReplaceHeader := false
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
	
	shouldRecreateHeader := false.
	shouldReplaceHeader := true.

	contentStencil := [ BlElement new ] asStencil.
	headerStencil := [ BlElement new ] asStencil.

	self add: (layoutResizerLook := BrLayoutResizerLook new
		inherit; "for myself"
		matchParentToMatchParentIn: [ :aBlock | self resizableElementsDo: aBlock ];
		exactToMatchParentIn: [ :aBlock | self resizableElementsDo: aBlock ];
		fitContentToFitContentIn: [ :aBlock | self resizableElementsDo: aBlock ])
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

	self when: BrExpansionChanged do: [ :anEvent |
		anEvent expanded
			ifTrue: [ self onExpanded ]
			ifFalse: [ self onCollapsed ] ].
	self when: BrAccordionContentStencilChanged do: [ :anEvent | self contentStencil: anEvent stencil ].
	self when: BrAccordionHeaderStencilChanged do: [ :anEvent | self headerStencil: anEvent stencil ]
]

{ #category : #initialization }
BrExpanderLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrAccordionContentStencilRequest new.
	self request: BrAccordionHeaderStencilRequest new.
	self request: BrExpansionStateRequest new
]

{ #category : #hooks }
BrExpanderLook >> onCollapsed [
	contentElement ifNotNil: #removeFromParent.
	
	shouldRecreateHeader
		ifTrue: [
			headerElement ifNotNil: #removeFromParent.
			headerElement := nil ].

	headerElement ifNil: [ self initializeHeaderElement ].
	headerElement hasParent
		ifFalse: [ self addHeaderElement: headerElement ]
]

{ #category : #hooks }
BrExpanderLook >> onExpanded [
	shouldReplaceHeader
		ifTrue: [ headerElement ifNotNil: #removeFromParent ]
		ifFalse: [
			headerElement ifNil: [ self initializeHeaderElement ].
			headerElement hasParent
				ifFalse: [ self addHeaderElement: headerElement ] ].
	
	contentElement ifNil: [ self initializeContentElement ].
	contentElement hasParent
		ifFalse: [ self addContentElement: contentElement ]
]

{ #category : #'api - configuration' }
BrExpanderLook >> recreateHeader [
	"Tell expander to recreate the header every time I am collapsed"
	shouldRecreateHeader := true
]

{ #category : #accessing }
BrExpanderLook >> resizableElementsDo: aBlock [
	"Evaluate a given block with elements to which layout resizers should be applied"
	
	headerElement ifNotNil: aBlock.
	contentElement ifNotNil: aBlock
]
