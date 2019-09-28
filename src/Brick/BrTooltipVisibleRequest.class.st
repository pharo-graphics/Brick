Class {
	#name : #BrTooltipVisibleRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #initialization }
BrTooltipVisibleRequest >> responseClass [
	^ BrTooltipVisibleChanged
]
