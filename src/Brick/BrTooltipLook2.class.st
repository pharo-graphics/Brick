Class {
	#name : #BrTooltipLook2,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipLook2 >> initializeListeners [
	super initializeListeners.

	self when: BrTooltipHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrTooltipContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrTooltipLook2 >> initializeRequests [
	super initializeRequests.

	self request: BrTooltipHandleRequest new.
	self request: BrTooltipContentRequest new
]
