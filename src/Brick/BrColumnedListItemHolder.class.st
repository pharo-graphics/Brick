Class {
	#name : #BrColumnedListItemHolder,
	#superclass : #BrListItemHolder,
	#instVars : [
		'columns',
		'columnElements'
	],
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrColumnedListItemHolder >> columnElements [
	^ columnElements
]

{ #category : #accessing }
BrColumnedListItemHolder >> columnElements: anObject [
	columnElements := anObject
]

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
