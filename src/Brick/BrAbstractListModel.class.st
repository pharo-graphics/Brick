Class {
	#name : #BrAbstractListModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'items',
		'itemTypeStencil',
		'itemIdStencil'
	],
	#category : #'Brick-List - Model'
}

{ #category : #initialization }
BrAbstractListModel >> initialize [
	super initialize.

	items := #().
	itemTypeStencil := [ :anItemTypeFactory | anItemTypeFactory default ] asStencilBuilder: BrListItemTypeStencilBuilder.
	itemIdStencil := nil
]

{ #category : #initialization }
BrAbstractListModel >> initializeListeners [
	super initializeListeners.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ :aResponse | aResponse items: self items ].
	self when: BrListItemTypeStencilRequest reply: [ :aResponse | aResponse itemTypeStencil: self itemTypeStencil ].
	self when: BrListItemIdStencilRequest reply: [ :aResponse | aResponse itemIdStencil: self itemIdStencil ].
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemAt: anIndex [
	^ self items at: anIndex
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemCount [
	<return: #Number>

	^ self items size
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemIdStencil [
	"Return a stencil that is used to create an item id of a given item object"
	<return: #BrListItemIdStencilBuilder or: nil>

	^ itemIdStencil
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemIdStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemIdStencil := aStencil asStencilBuilder: BrListItemIdStencilBuilder.
	self dispatchEvent: (BrListItemIdStencilChangedEvent new itemIdStencil: itemIdStencil)
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemTypeStencil [
	"Return a stencil that is used to create an item type of a given item object"
	<return: #BrListItemTypeStencilBuilder>

	^ itemTypeStencil
]

{ #category : #'api - accessing' }
BrAbstractListModel >> itemTypeStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemTypeStencil := aStencil asStencilBuilder: BrListItemTypeStencilBuilder.
	self dispatchEvent: (BrListItemTypeStencilChangedEvent new itemTypeStencil: itemTypeStencil)
]

{ #category : #'api - accessing' }
BrAbstractListModel >> items [
	<return: #Collection of: #Object>
	
	^ items
]

{ #category : #'api - accessing' }
BrAbstractListModel >> items: aCollectionOfObjects [

	items := aCollectionOfObjects.
	self dispatchEvent: (BrListItemsChangedEvent items: self items)
]
