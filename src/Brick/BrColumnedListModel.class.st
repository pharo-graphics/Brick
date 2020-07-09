Class {
	#name : #BrColumnedListModel,
	#superclass : #BrAbstractListModel,
	#instVars : [
		'columns'
	],
	#category : #'Brick-List - Model'
}

{ #category : #accessing }
BrColumnedListModel >> column [
	^ columns column
]

{ #category : #initialization }
BrColumnedListModel >> initialize [
	super initialize.

	self add: (columns := BrColumnedModel new)
]
