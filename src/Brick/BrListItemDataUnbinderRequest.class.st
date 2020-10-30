Class {
	#name : #BrListItemDataUnbinderRequest,
	#superclass : #BrRequest,
	#category : #'Brick-List - Events'
}

{ #category : #initialization }
BrListItemDataUnbinderRequest >> responseClass [
	^ BrListItemDataUnbinderChangedEvent
]
