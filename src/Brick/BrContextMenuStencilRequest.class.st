Class {
	#name : #BrContextMenuStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Context Menu - Events'
}

{ #category : #initialization }
BrContextMenuStencilRequest >> responseClass [
	^ BrContextMenuStencilChanged
]
