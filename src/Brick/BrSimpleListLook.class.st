Class {
	#name : #BrSimpleListLook,
	#superclass : #BrLook,
	#instVars : [
		'listElement',
		'scrollbar'
	],
	#category : #'Brick-List - Look'
}

{ #category : #initialization }
BrSimpleListLook >> initialize [
	super initialize.

	listElement := BrInfiniteListElement new.	
	self add: (BrLayoutResizerLook inherit inherit: listElement).
	self addChangeAddChildAs: #(content list) with: [ listElement ].
	
	scrollbar := (BrGlamorousVerticalScrollbarStencil new scrollable: listElement) asElement.
	self addChangeAddChildAs: #(content scrollbar) with: [ scrollbar ].

	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | listElement dataSource listElement: self widgetContent ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrSimpleListLook >> initializeListeners [
	super initializeListeners.

	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ].
	self when: BrListItemTypeStencilChangedEvent do: [ :anEvent | self onItemTypeStencilChanged: anEvent itemTypeStencil ].
	self when: BrListItemElementStencilChangedEvent do: [ :anEvent | self onItemElementStencilChanged: anEvent itemElementStencil ].
	self when: BrListItemDataBinderChangedEvent do: [ :anEvent | self onItemDataBinderChanged: anEvent itemDataBinder ].
]

{ #category : #initialization }
BrSimpleListLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrListItemsRequest new.
	self request: BrSelectionRequest new.
	self request: BrListItemTypeStencilRequest new.
	self request: BrListItemElementStencilRequest new.
	self request: BrListItemDataBinderRequest new
]

{ #category : #accessing }
BrSimpleListLook >> listElement [
	^ listElement
]

{ #category : #hooks }
BrSimpleListLook >> onItemDataBinderChanged: aBrListItemDataBinder [
	listElement dataSource itemDataBinder: aBrListItemDataBinder
]

{ #category : #hooks }
BrSimpleListLook >> onItemElementStencilChanged: aBrListItemElementStencilBuilder [
	listElement dataSource itemElementStencil: aBrListItemElementStencilBuilder
]

{ #category : #hooks }
BrSimpleListLook >> onItemTypeStencilChanged: aBrListItemTypeStencilBuilder [
	listElement dataSource itemTypeStencil: aBrListItemTypeStencilBuilder
]

{ #category : #hooks }
BrSimpleListLook >> onItemsChanged: aCollectionOfObjects [
	listElement dataSource rowValues: aCollectionOfObjects
]

{ #category : #hooks }
BrSimpleListLook >> onSelectionChanged: aCollectionOfIndices [
	listElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]
