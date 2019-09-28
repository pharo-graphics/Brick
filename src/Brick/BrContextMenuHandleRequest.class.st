Class {
	#name : #BrContextMenuHandleRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuHandleRequest >> responseClass [
	^ BrContextMenuHandleChanged
]
