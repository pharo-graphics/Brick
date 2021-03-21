Class {
	#name : #BrContextMenuContentRequest,
	#superclass : #BrAnchoredContentRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuContentRequest >> responseClass [
	^ BrContextMenuContentChanged
]
