Class {
	#name : #BrContextMenuStencilRequest,
	#superclass : #BrAnchoredStencilRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuStencilRequest >> responseClass [
	^ BrContextMenuStencilChanged
]
