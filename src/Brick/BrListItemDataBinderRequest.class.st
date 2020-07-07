Class {
	#name : #BrListItemDataBinderRequest,
	#superclass : #BrRequest,
	#category : #'Brick-List - Events'
}

{ #category : #initialization }
BrListItemDataBinderRequest >> responseClass [
	^ BrListItemDataBinderChangedEvent
]
