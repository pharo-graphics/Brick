Class {
	#name : #BrGlamorousButtonWithLabelTooltipLook,
	#superclass : #BrGlamorousWithLabelTooltipLook,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipLook >> initializeListeners [
	super initializeListeners.
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrGlamorousButtonWithLabelTooltipLook >> initializeRequests [
	super initializeRequests.
	self request: BrLabelRequest new
]

{ #category : #'instance creation' }
BrGlamorousButtonWithLabelTooltipLook >> newLabelWithText: aTextOrString [
	^ (super newLabelWithText: aTextOrString)
			when: BlClickEvent
				do: [ self widgetDo: [ :e | e phlow spawnObject: e action ] ]
]
