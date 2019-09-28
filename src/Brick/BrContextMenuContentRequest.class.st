Class {
	#name : #BrContextMenuContentRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuContentRequest >> responseClass [
	^ BrContextMenuContentChanged
]
