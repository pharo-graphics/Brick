Class {
	#name : #BrListItemIdStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-List - Events'
}

{ #category : #initialization }
BrListItemIdStencilRequest >> responseClass [
	^ BrListItemIdStencilChangedEvent
]
