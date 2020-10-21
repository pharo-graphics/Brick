Class {
	#name : #BrTooltipLook,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipLook >> initializeListeners [
	super initializeListeners.

	self when: BrTooltipHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrTooltipContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrTooltipLook >> initializeRequests [
	super initializeRequests.

	self request: BrTooltipHandleRequest new.
	self request: BrTooltipContentRequest new
]
