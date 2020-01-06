Class {
	#name : #BrColumnedListItemHolder,
	#superclass : #BrListItemHolder,
	#instVars : [
		'columns'
	],
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrColumnedListItemHolder >> columns [
	^ columns
]

{ #category : #accessing }
BrColumnedListItemHolder >> columns: aCollectionOfBrListColumn [
	columns := aCollectionOfBrListColumn
]

{ #category : #initialization }
BrColumnedListItemHolder >> initialize [
	super initialize.
	
	columns := #()
]

{ #category : #'api - binding' }
BrColumnedListItemHolder >> rowValue: anObject at: aRowIndex [
	| theCellElements |

	rowValue := anObject.

	itemElement := (self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		listElement: self listElement;
		build) asElement.

	theCellElements := self columns withIndexCollect: [ :aListColumn :aColumnIndex |	
		| aCellElement |
		aCellElement := (aListColumn stencil
			rowValue: anObject;
			rowIndex: aRowIndex;
			columnIndex: aColumnIndex;
			build) asElement.
		aListColumn width applyOn: aCellElement.
		aCellElement ].
	
	itemElement addChildren: theCellElements
]
