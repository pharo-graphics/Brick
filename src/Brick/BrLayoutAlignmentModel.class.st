Class {
	#name : #BrLayoutAlignmentModel,
	#superclass : #BrStateModel,
	#instVars : [
		'alignment'
	],
	#pools : [
		'BrLayoutAlignmentTypes'
	],
	#category : #'Brick-Layout Alignment - Model'
}

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> alignment: anObject [
	^ self new alignment: anObject
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> bottomCenter [
	^ self alignment: BottomCenter
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> bottomLeft [
	^ self alignment: BottomLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> bottomRight [
	^ self alignment: BottomRight
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> center [
	^ self alignment: Center
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> centerLeft [
	^ self alignment: CenterLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> centerRight [
	^ self alignment: CenterRight
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> topCenter [
	^ self alignment: TopCenter
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> topLeft [
	^ self alignment: TopLeft
]

{ #category : #'instance creation' }
BrLayoutAlignmentModel class >> topRight [
	^ self alignment: TopRight
]

{ #category : #accessing }
BrLayoutAlignmentModel >> alignment [
	^ alignment
]

{ #category : #accessing }
BrLayoutAlignmentModel >> alignment: anAlignment [

	self
		assert: [ anAlignment isNotNil ]
		description: [ 'Alignment must not be nil' ].

	alignment := anAlignment.
	self notifyStateChanged: anAlignment
]

{ #category : #accessing }
BrLayoutAlignmentModel >> bottomCenter [
	self alignment: BottomCenter
]

{ #category : #accessing }
BrLayoutAlignmentModel >> bottomLeft [
	self alignment: BottomLeft
]

{ #category : #accessing }
BrLayoutAlignmentModel >> bottomRight [
	self alignment: BottomRight
]

{ #category : #accessing }
BrLayoutAlignmentModel >> center [
	self alignment: Center
]

{ #category : #accessing }
BrLayoutAlignmentModel >> centerLeft [
	self alignment: CenterLeft
]

{ #category : #accessing }
BrLayoutAlignmentModel >> centerRight [
	self alignment: CenterRight
]

{ #category : #initialization }
BrLayoutAlignmentModel >> initialize [
	super initialize.

	alignment := #topLeft
]

{ #category : #initialization }
BrLayoutAlignmentModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrLayoutAlignmentRequest reply: [ :aResponse | aResponse alignment: self alignment ].
	self when: BrLayoutAlignmentWish do: [ :aWish | self alignment: aWish alignment ]
]

{ #category : #'state - accessing' }
BrLayoutAlignmentModel >> stateChangedEventClass [
	^ BrLayoutAlignmentChanged
]

{ #category : #'state - streaming' }
BrLayoutAlignmentModel >> streamStateOn: aStream [
	aStream nextPut: (BrLayoutAlignmentState alignment: self alignment)
]

{ #category : #accessing }
BrLayoutAlignmentModel >> topCenter [
	self alignment: TopCenter
]

{ #category : #accessing }
BrLayoutAlignmentModel >> topLeft [
	self alignment: TopLeft
]

{ #category : #accessing }
BrLayoutAlignmentModel >> topRight [
	self alignment: TopRight
]
