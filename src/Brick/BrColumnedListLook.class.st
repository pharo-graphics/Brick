Class {
	#name : #BrColumnedListLook,
	#superclass : #BrLook,
	#traits : 'TBrListInfiniteElementScroll',
	#classTraits : 'TBrListInfiniteElementScroll classTrait',
	#instVars : [
		'listElement',
		'rowStencil'
	],
	#category : #'Brick-List - Look'
}

{ #category : #initialization }
BrColumnedListLook >> initialize [
	super initialize.
	
	listElement := BrInfiniteListElement new.
	listElement dataSource: BrColumnedListDataSource new.
	
	self add: (BrLayoutResizerLook inherit inherit: listElement).
				
	self addChangeAddChildAs: #(content scrollable) with: [ listElement ].

	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
		
	self
		addChange:
			(BrLookChange new
				up: [ :e | listElement dataSource listElement: self widgetContent ];
				down: [ :e |  ];
				yourself).
]

{ #category : #initialization }
BrColumnedListLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrColumnsChanged do: [ :anEvent | self onColumnsChanged: anEvent columns ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ].
	self when: BrListItemTypeStencilChangedEvent do: [ :anEvent | self onItemTypeStencilChanged: anEvent itemTypeStencil ].
	
	self initializeScrollListeners
]

{ #category : #initialization }
BrColumnedListLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrListItemsRequest new.
	self request: BrColumnsRequest new.
	self request: BrSelectionRequest new.
	self request: BrListItemTypeStencilRequest new.
]

{ #category : #accessing }
BrColumnedListLook >> listElement [
	^ listElement
]

{ #category : #hooks }
BrColumnedListLook >> onColumnsChanged: aCollectionOfBrListColumns [
	self listElement dataSource columns: aCollectionOfBrListColumns
]

{ #category : #hooks }
BrColumnedListLook >> onItemTypeStencilChanged: aBrListItemTypeStencilBuilder [
	self listElement dataSource itemTypeStencil: aBrListItemTypeStencilBuilder
]

{ #category : #hooks }
BrColumnedListLook >> onItemsChanged: aCollectionOfBrWidgetModels [
	self listElement dataSource rowValues: aCollectionOfBrWidgetModels
]

{ #category : #hooks }
BrColumnedListLook >> onSelectionChanged: aCollectionOfIndices [
	self listElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]

{ #category : #accessing }
BrColumnedListLook >> rowStencilBuilder: aStencil [
	"aStencil is expected to be a subclass of BrListRowStencilBuilder or a valuable"
	rowStencil := aStencil asStencilBuilder: BrListRowStencilBuilder.

	self listElement dataSource itemElementStencil: rowStencil
]
