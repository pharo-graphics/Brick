Class {
	#name : #BrColumnedTreeItemHolder,
	#superclass : #BrTreeItemHolder,
	#instVars : [
		'columns',
		'columnElements'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrColumnedTreeItemHolder >> columnElements [
	^ columnElements
]

{ #category : #accessing }
BrColumnedTreeItemHolder >> columnElements: anObject [
	columnElements := anObject
]

{ #category : #accessing }
BrColumnedTreeItemHolder >> columns [
	^ columns
]

{ #category : #accessing }
BrColumnedTreeItemHolder >> columns: aCollectionOfBrListColumn [
	columns := aCollectionOfBrListColumn
]

{ #category : #accessing }
BrColumnedTreeItemHolder >> initialize [
	super initialize.
	
	columns := #()
]
