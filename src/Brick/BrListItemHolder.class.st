Class {
	#name : #BrListItemHolder,
	#superclass : #BlInfiniteHolder,
	#instVars : [
		'rowValue'
	],
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrListItemHolder >> itemElement: anElement [
	itemElement := anElement.
	itemElement compositingMode wantsCompositionLayer
		ifFalse: [ itemElement beInSeparateCompositionLayer ]
]

{ #category : #accessing }
BrListItemHolder >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrListItemHolder >> rowValue: anObject [
	rowValue := anObject
]
