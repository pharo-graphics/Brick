Class {
	#name : #BrResizerStyler,
	#superclass : #BrInteractiveStyler,
	#category : #'Brick-Resizer - Look'
}

{ #category : #accessing }
BrResizerStyler >> bottom: aBlock [
	self
		when: self state bottom
		style: aBlock
]

{ #category : #accessing }
BrResizerStyler >> horizontal: aBlock [
	self
		when: (self state top or: self state bottom)
		style: aBlock
]

{ #category : #accessing }
BrResizerStyler >> state [
	<return: #'BrInteractionState class'>

	^ BrResizerLocationState
]

{ #category : #accessing }
BrResizerStyler >> top: aBlock [
	self
		when: self state top
		style: aBlock
]
