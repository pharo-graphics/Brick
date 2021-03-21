Class {
	#name : #BrTooltipHandleRequest,
	#superclass : #BrAnchoredHandleRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipHandleRequest >> responseClass [
	^ BrTooltipHandleChanged
]
