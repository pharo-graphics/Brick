Class {
	#name : #BrTooltipAnchorRequest,
	#superclass : #BrAnchoredAnchorRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipAnchorRequest >> responseClass [
	^ BrTooltipAnchorChanged
]
