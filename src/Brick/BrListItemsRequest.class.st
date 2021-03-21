Class {
	#name : #BrListItemsRequest,
	#superclass : #BrRequest,
	#category : 'Brick-List - Events'
}

{ #category : #initialization }
BrListItemsRequest >> responseClass [
	^ BrListItemsChangedEvent
]
