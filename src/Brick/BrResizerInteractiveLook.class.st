Class {
	#name : #BrResizerInteractiveLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Resizer - Look'
}

{ #category : #'api - styling' }
BrResizerInteractiveLook >> bottom: aBlock [
	self
		when: self state bottom
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveLook >> horizontal: aBlock [
	self
		when: (self state left or: self state right)
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveLook >> left: aBlock [
	self
		when: self state left
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveLook >> right: aBlock [
	self
		when: self state right
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveLook >> state [
	<return: #'BrInteractionState class'>

	^ BrResizerLocationState
]

{ #category : #'api - styling' }
BrResizerInteractiveLook >> top: aBlock [
	self
		when: self state top
		style: aBlock
]

{ #category : #'api - styling' }
BrResizerInteractiveLook >> vertical: aBlock [
	self
		when: (self state top or: self state bottom)
		style: aBlock
]
