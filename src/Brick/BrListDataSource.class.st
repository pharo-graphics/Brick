Class {
	#name : #BrListDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rowValues',
		'selection',
		'itemTypeStencil',
		'itemElementStencil',
		'clickToSelectHandler',
		'listWidget'
	],
	#category : #'Brick-List - Support'
}

{ #category : #private }
BrListDataSource >> assignRowIndex: aPosition to: anElementHolder [
	anElementHolder itemElement
		userData at: #listRowIndex put: aPosition
]

{ #category : #initialization }
BrListDataSource >> initialize [
	super initialize.
	
	rowValues := #().
	selection := BlCompositeSelection new.
	clickToSelectHandler := BrListClickToSelectHandler new
]

{ #category : #accessing }
BrListDataSource >> itemCount [
	^ self rowValues size
]

{ #category : #'accessing - stencils' }
BrListDataSource >> itemElementStencil: aBrListItemElementStencilBuilder [
	itemElementStencil := aBrListItemElementStencilBuilder.
	self notifyChanged
]

{ #category : #accessing }
BrListDataSource >> itemTypeAt: anItemPosition [
	| anItemObject anItemType |

	anItemObject := self rowValues at: anItemPosition.

	anItemType := itemTypeStencil
		itemPosition: anItemPosition;
		itemObject: anItemObject;
		build.

	itemTypeStencil reset.

	^ anItemType
]

{ #category : #'accessing - stencils' }
BrListDataSource >> itemTypeStencil: aBrListItemTypeStencilBuilder [
	itemTypeStencil := aBrListItemTypeStencilBuilder.
	self notifyChanged
]

{ #category : #accessing }
BrListDataSource >> listElement [
	^ listWidget
]

{ #category : #accessing }
BrListDataSource >> listElement: aBrList [
	listWidget := aBrList.
	clickToSelectHandler listWidget: aBrList
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
