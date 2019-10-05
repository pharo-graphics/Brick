Class {
	#name : #BrTooltipContentRequest,
	#superclass : #BrAnchoredContentRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipContentRequest >> responseClass [
	^ BrTooltipContentChanged
]
