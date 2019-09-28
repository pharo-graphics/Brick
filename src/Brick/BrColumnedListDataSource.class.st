Class {
	#name : #BrColumnedListDataSource,
	#superclass : #BrListDataSource,
	#instVars : [
		'columns'
	],
	#category : 'Brick-List - Support'
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
	
	columns := #()
]

{ #category : #'instance creation' }
BrColumnedListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrColumnedListItemHolder new
		listElement: self listElement;
		rowStencilBuilder: rowStencil;
		columns: columns
]
