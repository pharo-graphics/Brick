Class {
	#name : #BrColumnedListLook,
	#superclass : #BrLook,
	#instVars : [
		'listElement',
		'rowStencil'
	],
	#category : 'Brick-List - Look'
}

{ #category : #initialization }
BrColumnedListLook >> initialize [
	super initialize.
	listElement := BrInfiniteListElement new.
	listElement dataSource: BrColumnedListDataSource new.
	self rowStencilBuilder: BrColumnedListRowStencilBuilder new.
	self add: (BrLayoutResizerLook inherit inherit: listElement).
	changes
		add:
			(BrLookChange new
				up: [ :e | listElement dataSource listElement: self widgetContent ];
				down: [ :e |  ];
				yourself).
	changes
		add: (#(content list) asBrLookChildAddAsChangeWithValue: [ listElement ]).
	changes
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout vertical ])
]

{ #category : #initialization }
BrColumnedListLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrColumnsChanged do: [ :anEvent | self onColumnsChanged: anEvent columns ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent selection ]
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
BrColumnedListLook >> onSelectionChanged: aBlSelection [
	listElement dataSource selection: aBlSelection
]

{ #category : #accessing }
BrColumnedListLook >> rowStencilBuilder: aStencil [
	"aStencil is expected to be a subclass of BrListRowStencilBuilder or a valuable"
	rowStencil := aStencil asStencilBuilder: BrListRowStencilBuilder.

	listElement dataSource rowStencilBuilder: rowStencil
]
