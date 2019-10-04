Class {
	#name : #BrContextMenuAnchorRequest,
	#superclass : #BrAnchoredAnchorRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuAnchorRequest >> responseClass [
	^ BrContextMenuAnchorChanged
]
