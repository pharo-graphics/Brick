Class {
	#name : #BrFlowListAptitude,
	#superclass : #BrAptitude,
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

{ #category : #initialization }
BrFlowListAptitude >> initialize [
	super initialize.
	items := #().
	itemElements := #().
	selection := BlSelection empty.
	listElement := BlElement new.
	listElement layout: BlFlowLayout horizontal.
	listElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	scrollableElement := BlScrollableElement new.
	scrollableElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	scrollableElement addChild: listElement as: #list.
	self itemStencilBuilder: BrSimpleListRowStencilBuilder new.
	self
		addChangeAddChildAs: #(content scrollable)
		with: [ scrollableElement ]
]

{ #category : #initialization }
BrFlowListAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrListItemsChangedEvent do: [ :anEvent | self onItemsChanged: anEvent items ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ]
]

{ #category : #accessing }
BrFlowListAptitude >> itemStencilBuilder: aStencilBuilder [
	"aStencilBuilder is expected to be a subclass of BrListRowStencil or a valuable"
	itemStencilBuilder := aStencilBuilder asStencilBuilder: BrListRowStencilBuilder.

	self updateList
]

{ #category : #accessing }
BrFlowListAptitude >> listElement [
	^ listElement
]

{ #category : #'event handling' }
BrFlowListAptitude >> onItemsChanged: aCollectionOfObjects [

	items := aCollectionOfObjects.
	self updateList
]

{ #category : #hooks }
BrFlowListAptitude >> onSelectionChanged: aCollectionOfIndices [
	selection := BlCompositeSelection fromIndices: aCollectionOfIndices.
	self updateSelection
]

{ #category : #updating }
BrFlowListAptitude >> updateList [
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
BrFlowListAptitude >> updateSelection [
	"itemElements withIndexDo: [ :eachItemElement :eachIndex |
		(selection contains: eachIndex)
			ifTrue: [ eachItemElement effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.15)) ]
			ifFalse: [ eachItemElement effect: BlNullEffect new ] ]"
]
