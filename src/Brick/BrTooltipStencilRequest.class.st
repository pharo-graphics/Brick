Class {
	#name : #BrTooltipStencilRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipStencilRequest >> responseClass [
	^ BrTooltipStencilChanged
]
