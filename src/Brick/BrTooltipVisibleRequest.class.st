Class {
	#name : #BrTooltipVisibleRequest,
	#superclass : #BrAnchoredVisibleRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipVisibleRequest >> responseClass [
	^ BrTooltipVisibleChanged
]
