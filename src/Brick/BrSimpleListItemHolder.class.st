Class {
	#name : #BrSimpleListItemHolder,
	#superclass : #BrListItemHolder,
	#instVars : [
		'rowValue'
	],
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrSimpleListItemHolder >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrSimpleListItemHolder >> rowValue: anObject [
	rowValue := anObject
]
