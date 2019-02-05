Class {
	#name : #BrGridListLook,
	#superclass : #BrLook,
	#instVars : [
		'items',
		'itemElements',
		'listElement',
		'scrollableElement',
		'itemStencilBuilder',
		'selection'
	],
	#category : #'Brick-List - Look'
}

{ #category : #accessing }
BrGridListLook >> columnCount: aNumber [
	listElement layoutDo: [ :l | l columnCount: aNumber ]
]

{ #category : #initialization }
BrGridListLook >> initialize [
	super initialize.
	
	items := #().
	itemElements := #().
	selection := BlSelection empty.

	listElement := BlElement new.
	listElement layout: (BlGridLayout horizontal columnCount: 2).
	listElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ].
	
	scrollableElement := BlScrollableElement new.
	scrollableElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	
	scrollableElement addChild: listElement as: #list.
	
	self itemStencilBuilder: BrSimpleListRowStencilBuilder new
]

{ #category : #initialization }
BrGridListLook >> initializeListeners [
	super initializeListeners.

	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent selection ]
]

{ #category : #initialization }
BrGridListLook >> initializeLook [
	super initializeLook.

	self widgetContent addChild: scrollableElement
]

{ #category : #accessing }
BrGridListLook >> itemStencilBuilder: aStencilBuilder [
	"aStencilBuilder is expected to be a subclass of BrListRowStencil or a valuable"
	itemStencilBuilder := aStencilBuilder asStencilBuilder: BrListRowStencilBuilder.

	self updateList
]

{ #category : #accessing }
BrGridListLook >> listElement [
	^ listElement
]

{ #category : #'event handling' }
BrGridListLook >> onItemsChanged: aCollectionOfObjects [

	items := aCollectionOfObjects.
	self updateList
]

{ #category : #hooks }
BrGridListLook >> onSelectionChanged: aBlSelection [
	selection := aBlSelection.
	self updateSelection
]

{ #category : #updating }
BrGridListLook >> updateList [
	listElement removeChildren.
	
	itemElements := items withIndexCollect: [ :eachItem :eachIndex |
		(itemStencilBuilder
			rowValue: eachItem;
			rowIndex: eachIndex;
			listElement: self listElement;
			build) asElement ].
		
	listElement addChildren: itemElements
]

{ #category : #updating }
BrGridListLook >> updateSelection [
	"itemElements withIndexDo: [ :eachItemElement :eachIndex |
		(selection contains: eachIndex)
			ifTrue: [ eachItemElement effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.15)) ]
			ifFalse: [ eachItemElement effect: BlNullEffect new ] ]"
]
