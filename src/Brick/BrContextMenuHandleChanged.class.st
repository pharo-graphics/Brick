Class {
	#name : #BrContextMenuHandleChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'handle'
	],
	#category : #'Brick-Context Menu - Events'
}

{ #category : #accessing }
BrContextMenuHandleChanged >> handle [
	^ handle
]

{ #category : #accessing }
BrContextMenuHandleChanged >> handle: anObject [
	handle := anObject
]
