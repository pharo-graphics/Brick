Class {
	#name : #BrContextMenuAptitude,
	#superclass : #BrAnchoredWithHandleAndContentAptitude,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #initialization }
BrContextMenuAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrContextMenuHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrContextMenuContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrContextMenuAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrContextMenuHandleRequest new.
	self request: BrContextMenuContentRequest new
]
