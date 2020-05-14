Class {
	#name : #BrColumnedListLook,
	#superclass : #BrLook,
	#instVars : [
		'listElement',
		'rowStencil',
		'scrollbar'
	],
	#category : #'Brick-List - Look'
}

{ #category : #initialization }
BrColumnedListLook >> initialize [
	super initialize.
	
	listElement := BrInfiniteListElement new.
	listElement dataSource: BrColumnedListDataSource new.
	self rowStencilBuilder: BrColumnedListRowStencilBuilder new.
	
	self add: (BrLayoutResizerLook inherit inherit: listElement).
	
	self
		addChange:
			(BrLookChange new
				up: [ :e | listElement dataSource listElement: self widgetContent ];
				down: [ :e |  ];
				yourself).
				
	self addChangeAddChildAs: #(content list) with: [ listElement ].
	scrollbar := (BrGlamorousVerticalScrollbarStencil new scrollable: listElement) asElement.
	self addChangeAddChildAs: #(content scrollbar) with: [ scrollbar ].

	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ]
]

{ #category : #initialization }
BrColumnedListLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrColumnsChanged do: [ :anEvent | self onColumnsChanged: anEvent columns ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ]
]

{ #category : #initialization }
BrColumnedListLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrListItemsRequest new.
	self request: BrColumnsRequest new.
	self request: BrSelectionRequest new
]

{ #category : #hooks }
BrColumnedListLook >> onColumnsChanged: aCollectionOfBrListColumns [
	listElement dataSource columns: aCollectionOfBrListColumns
]

{ #category : #hooks }
BrColumnedListLook >> onItemsChanged: aCollectionOfBrWidgetModels [
	listElement dataSource rowValues: aCollectionOfBrWidgetModels
]

{ #category : #hooks }
BrColumnedListLook >> onSelectionChanged: aCollectionOfIndices [
	listElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]

{ #category : #accessing }
BrColumnedListLook >> rowStencilBuilder: aStencil [
	"aStencil is expected to be a subclass of BrListRowStencilBuilder or a valuable"
	rowStencil := aStencil asStencilBuilder: BrListRowStencilBuilder.

	listElement dataSource rowStencilBuilder: rowStencil
]
