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

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> alignment: anObject [
	^ self new alignment: anObject
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> bottomCenter [
	^ self alignment: BottomCenter
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> bottomLeft [
	^ self alignment: BottomLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> bottomRight [
	^ self alignment: BottomRight
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> center [
	^ self alignment: Center
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> centerLeft [
	^ self alignment: CenterLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> centerRight [
	^ self alignment: CenterRight
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> topCenter [
	^ self alignment: TopCenter
]

{ #category : #'instance creation' }
BrLayoutAlignmentState class >> topLeft [
	^ self alignment: TopLeft
]

{ #category : #'instance creation' }
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
