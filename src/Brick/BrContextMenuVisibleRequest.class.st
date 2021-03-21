Class {
	#name : #BrContextMenuVisibleRequest,
	#superclass : #BrAnchoredVisibleRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuVisibleRequest >> responseClass [
	^ BrContextMenuVisibleChanged
]
