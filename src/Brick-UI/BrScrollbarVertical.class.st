Class {
	#name : #BrScrollbarVertical,
	#superclass : #BrScrollbarOrientation,
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> breadthOf: aTarget [ 
	^  aTarget width
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> defaultLayout [
	^ BlLinearLayout vertical
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> for: aTarget breadth: aValue [
	aTarget width: aValue
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> for: aTarget length: aValue [
	aTarget height: aValue
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> layoutDecButton: aButton [
		^ aButton beAtTop
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> layoutIncButton: aButton [
	^ aButton beAtBottom
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> layoutTrack: aTrack [
	^ aTrack constraintsDo: [ :c | 
		c vertical matchParent.
		c linear vertical alignCenter.
		c linear horizontal alignRight  ]
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> layoutWidget: aWidget [
	^ aWidget constraintsDo: [ :c | c vertical matchParent ]
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> lengthOf: aTarget [ 
	^  aTarget height
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> minLengthOf: aTarget [
	^ aTarget minHeight
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> positionFromPoint: aPoint [
	^  aPoint y
]

{ #category : #'as yet unclassified' }
BrScrollbarVertical >> translate: aTarget by: aNumber [
	aTarget translateBy: 0 @ aNumber
]
