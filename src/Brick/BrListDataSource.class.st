Class {
	#name : #BrListDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rowValues',
		'selection',
		'rowStencil',
		'listElement'
	],
	#category : #'Brick-List - Support'
}

{ #category : #initialization }
BrListDataSource >> initialize [
	super initialize.
	
	rowValues := #().
	rowStencil := [ :anObject :anElement | anElement ].
	selection := BlCompositeSelection new
]

{ #category : #accessing }
BrListDataSource >> itemCount [
	^ self rowValues size
]

{ #category : #accessing }
BrListDataSource >> listElement [
	^ listElement
]

{ #category : #accessing }
BrListDataSource >> listElement: anObject [
	listElement := anObject
]

{ #category : #'instance creation' }
BrListDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder rowValue: (self rowValues at: aPosition) at: aPosition.

	(self selection contains: aPosition)
		ifTrue: [
			anElementHolder itemElement effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.15)).
			anElementHolder itemElement dispatchEvent: (BrSelectedWish selected: true) ]
		ifFalse: [
			anElementHolder itemElement effect: BlNullEffect new.
			anElementHolder itemElement dispatchEvent: (BrSelectedWish selected: false) ]
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
BrListDataSource >> rowStencilBuilder: aStencil [

	rowStencil := aStencil.
	self notifyChanged
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
