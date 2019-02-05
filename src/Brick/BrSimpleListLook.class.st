Class {
	#name : #BrSimpleListLook,
	#superclass : #BrLook,
	#instVars : [
		'listElement',
		'itemStencilBuilder'
	],
	#category : #'Brick-List - Look'
}

{ #category : #initialization }
BrSimpleListLook >> initialize [
	super initialize.
	
	listElement := BrInfiniteListElement new.
	listElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	
	self itemStencilBuilder: BrSimpleListRowStencilBuilder new
]

{ #category : #initialization }
BrSimpleListLook >> initializeListeners [
	super initializeListeners.

	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent selection ]
]

{ #category : #initialization }
BrSimpleListLook >> initializeLook [
	super initializeLook.
	
	listElement dataSource listElement: self widgetContent.
	self widgetContent addChild: listElement as: #list
]

{ #category : #initialization }
BrSimpleListLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrListItemsRequest new.
	self request: BrSelectionRequest new
]

{ #category : #accessing }
BrSimpleListLook >> itemStencilBuilder: aStencilBuilder [
	"aStencilBuilder is expected to be a subclass of BrListRowStencil or a valuable"
	itemStencilBuilder := aStencilBuilder asStencilBuilder: BrListRowStencilBuilder.

	listElement dataSource rowStencilBuilder: itemStencilBuilder
]

{ #category : #accessing }
BrSimpleListLook >> listElement [
	^ listElement
]

{ #category : #hooks }
BrSimpleListLook >> onItemsChanged: aCollectionOfObjects [
	listElement dataSource rowValues: aCollectionOfObjects
]

{ #category : #hooks }
BrSimpleListLook >> onSelectionChanged: aBlSelection [
	listElement dataSource selection: aBlSelection
]
