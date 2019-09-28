Class {
	#name : #BrPopupTargetRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Popup - Events'
}

{ #category : #initialization }
BrPopupTargetRequest >> responseClass [
	^ BrPopupTargetChanged
]
