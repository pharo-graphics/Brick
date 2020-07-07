Class {
	#name : #BrListDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rowValues',
		'selection',
		'listElement',
		'itemTypeStencil',
		'itemElementStencil',
		'itemDataBinder'
	],
	#category : #'Brick-List - Support'
}

{ #category : #initialization }
BrListDataSource >> initialize [
	super initialize.
	
	rowValues := #().
	selection := BlCompositeSelection new
]

{ #category : #accessing }
BrListDataSource >> itemCount [
	^ self rowValues size
]

{ #category : #'accessing - stencils' }
BrListDataSource >> itemDataBinder: aBrListItemDataBinderBuilder [
	itemDataBinder := aBrListItemDataBinderBuilder.
	self notifyChanged
]

{ #category : #'accessing - stencils' }
BrListDataSource >> itemElementStencil: aBrListItemElementStencilBuilder [
	itemElementStencil := aBrListItemElementStencilBuilder.
	self notifyChanged
]

{ #category : #'accessing - stencils' }
BrListDataSource >> itemTypeStencil: aBrListItemTypeStencilBuilder [
	itemTypeStencil := aBrListItemTypeStencilBuilder.
	self notifyChanged
]

{ #category : #accessing }
BrListDataSource >> listElement [
	^ listElement
]

{ #category : #accessing }
BrListDataSource >> listElement: anObject [
	listElement := anObject
]

{ #category : #hooks }
BrListDataSource >> onElementAttached: anElementHolder [
	| anItemElement anItemPosition anItemValue |
	
	anItemElement := anElementHolder itemElement.
	anItemPosition := anElementHolder position.
	anItemValue := self rowValues at: anItemPosition.

	self listElement enqueueTask: (BlTaskAction new action: [
		self listElement dispatchEvent: (BrListItemElementAttached new
			itemElement: anItemElement;
			rowIndex: anItemPosition;
			rowValue: anItemValue) ])
]

{ #category : #hooks }
BrListDataSource >> onElementDetached: anElementHolder [
	| anItemPosition anItemValue |

	anItemPosition := anElementHolder position.
	anItemValue := anElementHolder rowValue.

	self listElement enqueueTask: (BlTaskAction new action: [
		self listElement dispatchEvent: (BrListItemElementDetached new
			rowIndex: anItemPosition;
			rowValue: anItemValue) ])
]

{ #category : #accessing }
BrListDataSource >> rowValues [
	^ rowValues
]

{ #category : #accessing }
BrListDataSource >> rowValues: aCollection [

	rowValues := aCollection.
	self notifyChanged
]

{ #category : #accessing }
BrListDataSource >> selection [
	<return: #BlSelection>
	
	^ selection
]

{ #category : #accessing }
BrListDataSource >> selection: aBlSelection [
	selection := aBlSelection.
	self notifyChanged
]
