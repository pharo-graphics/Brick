Class {
	#name : #BrTooltipAptitude,
	#superclass : #BrAnchoredWithHandleAndContentAptitude,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrTooltipHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrTooltipContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrTooltipAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrTooltipHandleRequest new.
	self request: BrTooltipContentRequest new
]
