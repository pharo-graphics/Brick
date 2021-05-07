Class {
	#name : #BrResizerInteractiveAptitude,
	#superclass : #BrInteractiveAptitude,
	#category : #'Brick-Resizer - Look'
}

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> bottom: aBlock [
	self
		when: self state bottom
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> horizontal: aBlock [
	self
		when: (self state left or: self state right)
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> left: aBlock [
	self
		when: self state left
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> right: aBlock [
	self
		when: self state right
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> state [
	<return: #'BrInteractionState class'>

	^ BrResizerLocationState
]

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> top: aBlock [
	self
		when: self state top
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveAptitude >> vertical: aBlock [
	self
		when: (self state top or: self state bottom)
		style: aBlock
]
