Class {
	#name : #BrListItemHolder,
	#superclass : #BlInfiniteHolder,
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrListItemHolder >> itemElement: anElement [
	itemElement := anElement.
	itemElement beInSeparateCompositionLayer
]
