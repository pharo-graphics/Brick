Class {
	#name : #BrExpanderAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'contentStencil',
		'headerStencil',
		'contentElement',
		'headerElement',
		'shouldRecreateHeader',
		'shouldReplaceHeader'
	],
	#category : #'Brick-Expander - Look'
}

{ #category : #'protected - adding / removing' }
BrExpanderAptitude >> addContentElement: anElement [
	self widgetContent addChild: anElement
]

{ #category : #'protected - adding / removing' }
BrExpanderAptitude >> addHeaderElement: anElement [
	self widgetContent addChild: anElement
]

{ #category : #accessing }
BrExpanderAptitude >> contentStencil [
	 ^ contentStencil
]

{ #category : #accessing }
BrExpanderAptitude >> contentStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	contentStencil := aBrStencil asStencil.
	contentElement ifNotNil: #removeFromParent.
	contentElement := nil.
	
	self widgetDo: [ :aWidget |
		(aWidget states hasState: BrExpansionState expanded)
			ifTrue: [ self onExpanded ]
			ifFalse: [ self onCollapsed ] ]
]

{ #category : #'api - configuration' }
BrExpanderAptitude >> doNotReplaceHeader [
	"Tell expander to not replace header with the content, but instead just add it"
	
	shouldReplaceHeader := false
]

{ #category : #accessing }
BrExpanderAptitude >> headerStencil [
	 ^ headerStencil
]

{ #category : #accessing }
BrExpanderAptitude >> headerStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	headerStencil := aBrStencil asStencil.
	headerElement ifNotNil: #removeFromParent.
	headerElement := nil.

	self widgetDo: [ :aWidget |
		(aWidget states hasState: BrExpansionState expanded)
			ifTrue: [ self onExpanded ]
			ifFalse: [ self onCollapsed ] ]
]

{ #category : #initialization }
BrExpanderAptitude >> initialize [
	super initialize.
	
	shouldRecreateHeader := false.
	shouldReplaceHeader := true.

	contentStencil := [ BlElement new ] asStencil.
	headerStencil := [ BlElement new ] asStencil.

	self add: (BrLayoutResizerAptitude new
		inherit; "for myself"
		matchParentToMatchParent: [ :aBlock | self resizableElementsDo: aBlock ];
		exactToMatchParent: [ :aBlock | self resizableElementsDo: aBlock ];
		fitContentToFitContent: [ :aBlock | self resizableElementsDo: aBlock ];
		fitContentLimitedToFitContentLimited: [ :aBlock | self resizableElementsDo: aBlock ])
]

{ #category : #initialization }
BrExpanderAptitude >> initializeContentElement [
	contentElement := self contentStencil asElement.
	contentElement removeFromParent
]

{ #category : #initialization }
BrExpanderAptitude >> initializeHeaderElement [
	headerElement := self headerStencil asElement.
	headerElement removeFromParent
]

{ #category : #initialization }
BrExpanderAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrAccordionContentStencilChanged do: [ :anEvent | self contentStencil: anEvent stencil ].
	self when: BrAccordionHeaderStencilChanged do: [ :anEvent | self headerStencil: anEvent stencil ].
		
	self when: BrExpandedEvent do: [ :anEvent | self onExpanded ].
	self when: BrCollapsedEvent do: [ :anEvent | self onCollapsed ]
]

{ #category : #initialization }
BrExpanderAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrAccordionContentStencilRequest new.
	self request: BrAccordionHeaderStencilRequest new
]

{ #category : #hooks }
BrExpanderAptitude >> onCollapsed [
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
BrExpanderAptitude >> onExpanded [

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
BrExpanderAptitude >> recreateHeader [
	"Tell expander to recreate the header every time I am collapsed"
	shouldRecreateHeader := true
]

{ #category : #accessing }
BrExpanderAptitude >> resizableElementsDo: aBlock [
	"Evaluate a given block with elements to which layout resizers should be applied"
	
	headerElement ifNotNil: aBlock.
	contentElement ifNotNil: aBlock
]
