Class {
	#name : #BrLayoutAlignmentState,
	#superclass : #BrInteractionState,
	#instVars : [
		'alignment'
	],
	#pools : [
		'BrLayoutAlignmentTypes'
	],
	#category : #'Brick-Layout Alignment - States'
}

{ #category : #accessing }
BrLayoutAlignmentState class >> alignment: anObject [
	^ self new alignment: anObject
]

{ #category : #accessing }
BrLayoutAlignmentState class >> bottomCenter [
	^ self alignment: BottomCenter
]

{ #category : #accessing }
BrLayoutAlignmentState class >> bottomLeft [
	^ self alignment: BottomLeft
]

{ #category : #accessing }
BrLayoutAlignmentState class >> bottomRight [
	^ self alignment: BottomRight
]

{ #category : #accessing }
BrLayoutAlignmentState class >> center [
	^ self alignment: Center
]

{ #category : #accessing }
BrLayoutAlignmentState class >> centerLeft [
	^ self alignment: CenterLeft
]

{ #category : #accessing }
BrLayoutAlignmentState class >> centerRight [
	^ self alignment: CenterRight
]

{ #category : #accessing }
BrLayoutAlignmentState class >> topCenter [
	^ self alignment: TopCenter
]

{ #category : #accessing }
BrLayoutAlignmentState class >> topLeft [
	^ self alignment: TopLeft
]

{ #category : #accessing }
BrLayoutAlignmentState class >> topRight [
	^ self alignment: TopRight
]

{ #category : #comparing }
BrLayoutAlignmentState >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ alignment = anObject alignment
]

{ #category : #accessing }
BrLayoutAlignmentState >> alignment [
	^ alignment
]

{ #category : #accessing }
BrLayoutAlignmentState >> alignment: anObject [
	alignment := anObject
]

{ #category : #comparing }
BrLayoutAlignmentState >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash bitXor: alignment hash
]
