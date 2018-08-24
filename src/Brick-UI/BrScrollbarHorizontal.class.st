Class {
	#name : #BrScrollbarHorizontal,
	#superclass : #BrScrollbarOrientation,
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> breadthOf: aTarget [ 
	^  aTarget height
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> defaultLayout [
	^ BlLinearLayout horizontal
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> for: aTarget breadth: aValue [
	aTarget height: aValue
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> for: aTarget length: aValue [
	aTarget width: aValue
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> layoutDecButton: aButton [
	^ aButton beAtLeft
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> layoutIncButton: aButton [
	^ aButton beAtRight
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> layoutTrack: aTrack [
	^ aTrack constraintsDo: [ :c | 
		c  horizontal matchParent.
		c linear vertical alignBottom ]
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> layoutWidget: aWidget [
	^ aWidget constraintsDo: [ :c | c horizontal matchParent ]
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> lengthOf: aTarget [ 
	^  aTarget width
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> minLengthOf: aTarget [ 
	^  aTarget minWidth
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> positionFromPoint: aPoint [
	^  aPoint x
]

{ #category : #'as yet unclassified' }
BrScrollbarHorizontal >> translate: aTarget by: aNumber [
	aTarget translateBy: aNumber@0
]
