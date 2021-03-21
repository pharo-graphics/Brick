Class {
	#name : #BrTooltipModel,
	#superclass : #BrAnchoredModel,
	#category : #'Brick-Tooltip - Model'
}

{ #category : #notifying }
BrTooltipModel >> contentChangedEvent [
	^ BrTooltipContentChanged new
]

{ #category : #'as yet unclassified' }
BrTooltipModel >> contentRequestClass [
	^ BrTooltipContentRequest
]

{ #category : #notifying }
BrTooltipModel >> handleChangedEvent [
	^ BrTooltipHandleChanged new
]

{ #category : #'as yet unclassified' }
BrTooltipModel >> handleRequestClass [
	^ BrTooltipHandleRequest
]
