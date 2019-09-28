Class {
	#name : #BrLayoutAlignmentWish,
	#superclass : #BrWish,
	#instVars : [
		'alignment'
	],
	#pools : [
		'BrLayoutAlignmentTypes'
	],
	#category : #'Brick-Layout Alignment - Events'
}

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> alignment: anAlignment [
	^ self new alignment: anAlignment
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> bottomCenter [
	^ self alignment: BottomCenter
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> bottomLeft [
	^ self alignment: BottomLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> bottomRight [
	^ self alignment: BottomRight
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> center [
	^ self alignment: Center
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> centerLeft [
	^ self alignment: CenterLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> centerRight [
	^ self alignment: CenterRight
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> none [
	^ self alignment: None
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> topCenter [
	^ self alignment: TopCenter
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> topLeft [
	^ self alignment: TopLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentWish class >> topRight [
	^ self alignment: TopRight
]

{ #category : #accessing }
BrLayoutAlignmentWish >> alignment [
	^ alignment
]

{ #category : #accessing }
BrLayoutAlignmentWish >> alignment: anObject [
	alignment := anObject
]
