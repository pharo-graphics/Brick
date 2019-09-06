Class {
	#name : #BrContextMenuVisibleRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuVisibleRequest >> responseClass [
	^ BrContextMenuVisibleChanged
]
