Class {
	#name : #BrSimpleListLook,
	#superclass : #BrLook,
	#traits : 'TBrListInfiniteElementScroll',
	#classTraits : 'TBrListInfiniteElementScroll classTrait',
	#instVars : [
		'listElement'
	],
	#category : #'Brick-List - Look'
}

{ #category : #'api - orientation' }
BrSimpleListLook >> beHorizontal [
	| anOldListElement |
	self listElement class = BrHorizontalInfiniteListElement ifTrue: [ ^ self ].
	anOldListElement := self listElement.
	listElement := BrHorizontalInfiniteListElement new.
	self replaceListElement: anOldListElement by: self listElement.
	self requestListConfiguration.
]

{ #category : #'api - orientation' }
BrSimpleListLook >> beVertical [
	| anOldListElement |
	self listElement class = BrInfiniteListElement ifTrue: [ ^ self ].
	anOldListElement := self listElement.
	listElement := BrInfiniteListElement new.
	self replaceListElement: anOldListElement by: self listElement.
	self requestListConfiguration.
]

{ #category : #initialization }
BrSimpleListLook >> initialize [
	super initialize.

	self initializeListElement.
	
	self add: (BrLayoutResizerLook new
		inherit;
		inherit: [ self listElement ]).
	
	self addChangeAddChildAs: #(content scrollable) with: [ self listElement ].

	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateListElementParent ];
				down: [ :e |  ];
				yourself).
	
	self add: (BrListOrientationLook new
		horizontal: [ :aStyle | aStyle do: [ :aWidget | self beHorizontal ] ];
		vertical: [ :aStyle | aStyle do: [ :aWidget | self beVertical ] ])
]

{ #category : #initialization }
BrSimpleListLook >> initializeListElement [
	listElement := BrInfiniteListElement new.
]

{ #category : #initialization }
BrSimpleListLook >> initializeListeners [
	super initializeListeners.

	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ].
	self when: BrListItemTypeStencilChangedEvent do: [ :anEvent | self onItemTypeStencilChanged: anEvent itemTypeStencil ].
	self when: BrListItemIdStencilChangedEvent do: [ :anEvent | self onItemIdStencilChanged: anEvent itemIdStencil ].
	self when: BrListItemElementStencilChangedEvent do: [ :anEvent | self onItemElementStencilChanged: anEvent itemElementStencil ].
	self when: BrListItemDataBinderChangedEvent do: [ :anEvent | self onItemDataBinderChanged: anEvent itemDataBinder ].
	self when: BrListItemDataUnbinderChangedEvent do: [ :anEvent | self onItemDataUnbinderChanged: anEvent itemDataUnbinder ].
	
	self initializeScrollListeners
]

{ #category : #initialization }
BrSimpleListLook >> initializeRequests [
	super initializeRequests.
	self requestListConfiguration
]

{ #category : #'private - accessing' }
BrSimpleListLook >> listElement [
	^ listElement
]

{ #category : #hooks }
BrSimpleListLook >> onItemDataBinderChanged: aBrListItemDataBinder [
	self listElement dataSource itemDataBinder: aBrListItemDataBinder
]

{ #category : #hooks }
BrSimpleListLook >> onItemDataUnbinderChanged: aBrListItemDataUnbinder [
	self listElement dataSource itemDataUnbinder: aBrListItemDataUnbinder
]

{ #category : #hooks }
BrSimpleListLook >> onItemElementStencilChanged: aBrListItemElementStencilBuilder [
	self listElement dataSource itemElementStencil: aBrListItemElementStencilBuilder
]

{ #category : #hooks }
BrSimpleListLook >> onItemIdStencilChanged: aBrListItemIdStencilBuilder [
	self listElement dataSource itemIdStencil: aBrListItemIdStencilBuilder
]

{ #category : #hooks }
BrSimpleListLook >> onItemTypeStencilChanged: aBrListItemTypeStencilBuilder [
	self listElement dataSource itemTypeStencil: aBrListItemTypeStencilBuilder
]

{ #category : #hooks }
BrSimpleListLook >> onItemsChanged: aCollectionOfObjects [
	self listElement dataSource rowValues: aCollectionOfObjects
]

{ #category : #hooks }
BrSimpleListLook >> onSelectionChanged: aCollectionOfIndices [
	self listElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]

{ #category : #'private - updating' }
BrSimpleListLook >> replaceListElement: anOldListElement by: aNewListElement [
	self widgetDo: [ :aWidget |
		| aParent |
		aParent := anOldListElement parent.
		aParent replaceChild: anOldListElement with: aNewListElement as: #scrollable.
		self updateListElementParent. ]
]

{ #category : #initialization }
BrSimpleListLook >> requestListConfiguration [
	self request: BrListItemsRequest new.
	self request: BrSelectionRequest new.
	self request: BrListItemTypeStencilRequest new.
	self request: BrListItemIdStencilRequest new.
	self request: BrListItemElementStencilRequest new.
	self request: BrListItemDataBinderRequest new.
	self request: BrListItemDataUnbinderRequest new
]

{ #category : #'private - updating' }
BrSimpleListLook >> updateListElementParent [
	self listElement dataSource listElement: self widgetContent
]
