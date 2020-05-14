Class {
	#name : #BrScrollbarOrientationLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #'api - style' }
BrScrollbarOrientationLook >> horizontal: aBlock [
	self
		when: self state horizontal
		style: aBlock
]

{ #category : #accessing }
BrScrollbarOrientationLook >> state [
	^ BrScrollbarOrientationState
]

{ #category : #'api - style' }
BrScrollbarOrientationLook >> vertical: aBlock [
	self
		when: self state vertical
		style: aBlock
]
