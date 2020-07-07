Class {
	#name : #BrListItemTypeStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-List - Events'
}

{ #category : #initialization }
BrListItemTypeStencilRequest >> responseClass [
	^ BrListItemTypeStencilChangedEvent
]
