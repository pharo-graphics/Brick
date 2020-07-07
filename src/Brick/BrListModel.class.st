Class {
	#name : #BrListModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'items',
		'itemTypeStencil',
		'itemElementStencil',
		'itemDataBinder'
	],
	#category : #'Brick-List - Model'
}

{ #category : #initialization }
BrListModel >> initialize [
	super initialize.

	items := #().
	itemTypeStencil := [ :anItemTypeFactory | anItemTypeFactory default ] asStencilBuilder: BrListItemTypeStencilBuilder.
	itemElementStencil := BrListItemElementStencilBuilder new.
	itemDataBinder := BrListItemDataBinder new
]

{ #category : #hooks }
BrListModel >> initializeListeners [
	super initializeListeners.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ :aResponse | aResponse items: self items ].
	self when: BrListItemTypeStencilRequest reply: [ :aResponse | aResponse itemTypeStencil: self itemTypeStencil ].
	self when: BrListItemElementStencilRequest reply: [ :aResponse | aResponse itemElementStencil: self itemElementStencil ].
	self when: BrListItemDataBinderRequest reply: [ :aResponse | aResponse itemDataBinder: self itemDataBinder ]
]

{ #category : #'api - accessing' }
BrListModel >> itemAt: anIndex [
	^ self items at: anIndex
]

{ #category : #'api - accessing' }
BrListModel >> itemCount [
	<return: #Number>

	^ self items size
]

{ #category : #'api - accessing' }
BrListModel >> itemDataBinder [
	"Return a stencil that is used to bind data to a given item element"
	<return: #BrListItemDataBinder>

	^ itemDataBinder
]

{ #category : #'api - accessing' }
BrListModel >> itemDataBinder: aStencil [
	"Set a stencil that will be used to bind data to a given item element"

	itemDataBinder := aStencil asStencilBuilder: BrListItemDataBinder.
	self dispatchEvent: (BrListItemDataBinderChangedEvent new itemDataBinder: itemDataBinder)
]

{ #category : #'api - accessing' }
BrListModel >> itemElementStencil [
	"Return a stencil that is used to create an item element of a given type"
	<return: #BrListItemElementStencilBuilder>
	
	^ itemElementStencil
]

{ #category : #'api - accessing' }
BrListModel >> itemElementStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemElementStencil := aStencil asStencilBuilder: BrListItemElementStencilBuilder.
	self dispatchEvent: (BrListItemElementStencilChangedEvent new itemElementStencil: itemElementStencil)
]

{ #category : #'api - accessing' }
BrListModel >> itemTypeStencil [
	"Return a stencil that is used to create an item type of a given item object"
	<return: #BrListItemTypeStencilBuilder>

	^ itemTypeStencil
]

{ #category : #'api - accessing' }
BrListModel >> itemTypeStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemTypeStencil := aStencil asStencilBuilder: BrListItemTypeStencilBuilder.
	self dispatchEvent: (BrListItemTypeStencilChangedEvent new itemTypeStencil: itemTypeStencil)
]

{ #category : #'api - accessing' }
BrListModel >> items [
	<return: #Collection of: #Object>
	
	^ items
]

{ #category : #'api - accessing' }
BrListModel >> items: aCollectionOfObjects [

	items := aCollectionOfObjects.
	self dispatchEvent: (BrListItemsChangedEvent items: self items)
]
