Class {
	#name : #BrGlamorousButtonWithLabelTooltipAptitude,
	#superclass : #BrGlamorousWithLabelTooltipAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipAptitude >> initializeListeners [
	super initializeListeners.
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipAptitude >> initializeRequests [
	super initializeRequests.
	self request: BrLabelRequest new
]

{ #category : #'instance creation' }
BrGlamorousButtonWithLabelTooltipAptitude >> newLabelWithText: aTextOrString [
	^ (super newLabelWithText: aTextOrString)
			when: BlClickEvent
				do: [ self widgetDo: [ :e | e phlow spawnObject: e action ] ]
]
