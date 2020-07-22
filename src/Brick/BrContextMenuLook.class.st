Class {
	#name : #BrContextMenuLook,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #initialization }
BrContextMenuLook >> initializeListeners [
	super initializeListeners.

	self when: BrContextMenuHandleChanged do: [ :anEvent | self handle: anEvent handle ].
	self when: BrContextMenuContentChanged do: [ :anEvent | self content: anEvent content ]
]

{ #category : #initialization }
BrContextMenuLook >> initializeRequests [
	super initializeRequests.

	self request: BrContextMenuHandleRequest new.
	self request: BrContextMenuContentRequest new
]
