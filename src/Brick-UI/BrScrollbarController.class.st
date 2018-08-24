Class {
	#name : #BrScrollbarController,
	#superclass : #BrController,
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarController >> decrementButtonPressed: anEvent [
	widget scrollValue > widget min
		ifTrue: [ widget decrement ]
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> decrementValue [ 
	widget adjustValue: 0
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> end [ 
	widget scrollValue: widget max.
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> home [ 
	widget scrollValue: widget min.
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> incrementButtonPressed: anEvent [
	widget scrollValue < widget max
		ifTrue: [ widget increment ]
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> incrementValue [ 
	widget adjustValue: 1
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> thumbDraggedPosition: aPercentPosition [
	widget scrollValue: (aPercentPosition * widget max min: widget max max: widget min)
]

{ #category : #'as yet unclassified' }
BrScrollbarController >> trackPressPosition: aPercentPosition [
	widget adjustValue: aPercentPosition
]
