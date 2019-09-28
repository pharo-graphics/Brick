Class {
	#name : #BrPopupStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Popup - Events'
}

{ #category : #initialization }
BrPopupStencilRequest >> responseClass [
	^ BrPopupStencilChanged
]
