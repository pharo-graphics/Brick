Class {
	#name : #BrColumnedListDataSource,
	#superclass : #BrListDataSource,
	#instVars : [
		'columns'
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
	
	itemElementStencil := BrColumnedListRowElementStencilBuilder new.
	columns := #()
]

{ #category : #'instance creation' }
BrColumnedListDataSource >> onBindHolder: anElementHolder at: aPosition [
	| anItemObject eachColumnIndex |

	anItemObject := self rowValues at: aPosition.

	eachColumnIndex := 0.
	anElementHolder columns
		with: anElementHolder columnElements
		do: [ :eachColumn :eachCellElement |
			eachColumnIndex := eachColumnIndex + 1.
			
			eachColumn dataBinder
				cellElement: eachCellElement;
				rowObject: anItemObject;
				rowIndex: aPosition;
				rowHolder: anElementHolder;
				columnIndex: eachColumnIndex;
				build ].
	
	anElementHolder rowValue: anItemObject.	

	anElementHolder itemElement states removeState: BlElementState hovered.

	(self selection containsIndex: aPosition)
		ifTrue: [ anElementHolder itemElement states addState: BlElementSelectedState uniqueInstance ]
		ifFalse: [ anElementHolder itemElement states removeState: BlElementSelectedState uniqueInstance ]
]

{ #category : #'instance creation' }
BrColumnedListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	| aRowElement theColumnElements |

	aRowElement := itemElementStencil
		itemType: anItemType;
		asElement.

	theColumnElements := self columns withIndexCollect: [ :eachColumn :eachIndex |
		| eachColumnElement |
		
		eachColumnElement := eachColumn cellStencil
			itemType: anItemType;
			column: eachColumn;
			columnIndex: eachIndex;
			asElement.

		eachColumn width applyOn: eachColumnElement.
		
		eachColumnElement ].
	
	aRowElement addChildren: theColumnElements.
	aRowElement addEventHandler: clickToSelectHandler.
	
	^ BrColumnedListItemHolder new
		itemElement: aRowElement;
		columns: self columns;
		columnElements: theColumnElements
]

{ #category : #'accessing - stencils' }
BrColumnedListDataSource >> rowStencilBuilder: aStencil [
]
