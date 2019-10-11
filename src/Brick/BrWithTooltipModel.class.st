Class {
	#name : #BrWithTooltipModel,
	#superclass : #BrWithAnchoredModel,
	#category : #'Brick-Tooltip - Model'
}

{ #category : #notifying }
BrWithTooltipModel >> stencilChangedEvent [
	^ BrTooltipStencilChanged new
]

{ #category : #notifying }
BrWithTooltipModel >> stencilRequestClass [
	^ BrTooltipStencilRequest
]

{ #category : #notifying }
BrWithTooltipModel >> visibleChangedEvent [
	^ BrTooltipVisibleChanged new
]

{ #category : #notifying }
BrWithTooltipModel >> visibleRequestClass [
	^ BrTooltipVisibleRequest
]
