Class {
	#name : #BrTooltipStencilRequest,
	#superclass : #BrAnchoredStencilRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipStencilRequest >> responseClass [
	^ BrTooltipStencilChanged
]
