Class {
	#name : #BrTooltipModel,
	#superclass : #BrAnchoredModel,
	#category : #'Brick-Tooltip - Model'
}

{ #category : #'instance creation' }
BrTooltipModel class >> anchor: anElement [
	^ self new
		anchor: anElement;
		yourself
]

{ #category : #notifying }
BrTooltipModel >> anchorChangedEvent [
	^ BrTooltipAnchorChanged new
]

{ #category : #'as yet unclassified' }
BrTooltipModel >> anchorRequestClass [
	^ BrTooltipAnchorRequest
]

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
