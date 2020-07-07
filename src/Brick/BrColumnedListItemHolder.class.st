Class {
	#name : #BrColumnedListItemHolder,
	#superclass : #BrListItemHolder,
	#instVars : [
		'columns',
		'rowStencilBuilder',
		'listElement',
		'rowValue'
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
	
	"must be set by the data source"
	rowStencilBuilder := nil.

	columns := #()
]

{ #category : #accessing }
BrColumnedListItemHolder >> listElement [
	^ listElement
]

{ #category : #accessing }
BrColumnedListItemHolder >> listElement: aListWidgetElement [
	self 
		assert: [ aListWidgetElement isNotNil ]
		description: [ 'List must not be nil' ].

	listElement := aListWidgetElement
]

{ #category : #accessing }
BrColumnedListItemHolder >> rowStencilBuilder [
	<return: #BrListRowStencilBuilder>

	^ rowStencilBuilder
]

{ #category : #accessing }
BrColumnedListItemHolder >> rowStencilBuilder: aBrListRowStencil [
	rowStencilBuilder := aBrListRowStencil
]

{ #category : #accessing }
BrColumnedListItemHolder >> rowValue [
	^ rowValue
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
	theCellElements := self columns
		withIndexCollect: [ :aListColumn :aColumnIndex | 
			| aCellElement |
			aCellElement := (aListColumn stencil
				rowValue: anObject;
				rowIndex: aRowIndex;
				columnIndex: aColumnIndex;
				build) asElement.
			aListColumn width applyOn: aCellElement.
			aCellElement ].
	itemElement addChildren: theCellElements.
	itemElement beInSeparateCompositionLayer
]
