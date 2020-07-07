Class {
	#name : #BrColumnedListDataSource,
	#superclass : #BrListDataSource,
	#instVars : [
		'columns',
		'rowStencil'
	],
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrColumnedListDataSource >> columns [
	<return: #Collection of: #BrColumn>
	^ columns
]

{ #category : #accessing }
BrColumnedListDataSource >> columns: aCollectionOfBrListColumn [

	columns := aCollectionOfBrListColumn.
	self notifyChanged
]

{ #category : #initialization }
BrColumnedListDataSource >> initialize [
	super initialize.
	
	rowStencil := [ :anObject :anElement | anElement ].
	columns := #()
]

{ #category : #'instance creation' }
BrColumnedListDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder rowValue: (self rowValues at: aPosition) at: aPosition.

	(self selection containsIndex: aPosition)
		ifTrue: [
			anElementHolder itemElement effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.15)).
			anElementHolder itemElement dispatchEvent: (BrSelectedWish selected: true) ]
		ifFalse: [
			anElementHolder itemElement effect: BlNullEffect new.
			anElementHolder itemElement dispatchEvent: (BrSelectedWish selected: false) ]
]

{ #category : #'instance creation' }
BrColumnedListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrColumnedListItemHolder new
		listElement: self listElement;
		rowStencilBuilder: rowStencil;
		columns: columns
]

{ #category : #'accessing - stencils' }
BrColumnedListDataSource >> rowStencilBuilder: aStencil [

	rowStencil := aStencil.
	self notifyChanged
]
