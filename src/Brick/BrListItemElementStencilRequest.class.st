Class {
	#name : #BrListItemElementStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-List - Events'
}

{ #category : #initialization }
BrListItemElementStencilRequest >> responseClass [
	^ BrListItemElementStencilChangedEvent
]
