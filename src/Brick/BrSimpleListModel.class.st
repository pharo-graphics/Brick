Class {
	#name : #BrSimpleListModel,
	#superclass : #BrAbstractListModel,
	#instVars : [
		'itemElementStencil',
		'itemDataBinder',
		'itemDataUnbinder'
	],
	#category : #'Brick-List - Model'
}

{ #category : #initialization }
BrSimpleListModel >> initialize [
	super initialize.

	itemElementStencil := BrListItemElementStencilBuilder new.
	itemDataBinder := BrListItemDataBinder new.
	itemDataUnbinder := BrListItemDataUnbinder new
]

{ #category : #hooks }
BrSimpleListModel >> initializeListeners [
	super initializeListeners.

	self when: BrListItemElementStencilRequest reply: [ :aResponse | aResponse itemElementStencil: self itemElementStencil ].
	self when: BrListItemDataBinderRequest reply: [ :aResponse | aResponse itemDataBinder: self itemDataBinder ].
	self when: BrListItemDataUnbinderRequest reply: [ :aResponse | aResponse itemDataUnbinder: self itemDataUnbinder ]
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemDataBinder [
	"Return a stencil that is used to bind data to a given item element"
	<return: #BrListItemDataBinder>

	^ itemDataBinder
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemDataBinder: aStencil [
	"Set a stencil that will be used to bind data to a given item element"

	itemDataBinder := aStencil asStencilBuilder: BrListItemDataBinder.
	self dispatchEvent: (BrListItemDataBinderChangedEvent new itemDataBinder: itemDataBinder)
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemDataUnbinder [
	"Return a stencil that is used to unbind data from a given item element"
	<return: #BrListItemDataUnbinder>

	^ itemDataUnbinder
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemDataUnbinder: aStencil [
	"Set a stencil that will be used to unbind data from a given item element"

	itemDataUnbinder := aStencil asStencilBuilder: BrListItemDataUnbinder.
	self dispatchEvent: (BrListItemDataUnbinderChangedEvent new itemDataUnbinder: itemDataUnbinder)
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemElementStencil [
	"Return a stencil that is used to create an item element of a given type"
	<return: #BrListItemElementStencilBuilder>
	
	^ itemElementStencil
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemElementStencil: aStencil [
	"Set a stencil that will be used to create an item element of a given type"

	itemElementStencil := aStencil asStencilBuilder: BrListItemElementStencilBuilder.
	self dispatchEvent: (BrListItemElementStencilChangedEvent new itemElementStencil: itemElementStencil)
]
