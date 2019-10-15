Class {
	#name : #BrContextMenuHandleRequest,
	#superclass : #BrAnchoredHandleRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuHandleRequest >> responseClass [
	^ BrContextMenuHandleChanged
]
