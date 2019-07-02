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
