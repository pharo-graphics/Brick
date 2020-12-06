Class {
	#name : #BrScrollbarOrientationLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #'api - style' }
BrScrollbarOrientationLook >> horizontal [
	^ self styleFor: (BrScrollbarOrientationState horizontal)
]

{ #category : #'api - style' }
BrScrollbarOrientationLook >> horizontal: aBlock [
	aBlock value: self horizontal
]

{ #category : #'api - style' }
BrScrollbarOrientationLook >> vertical [
	^ self styleFor: (BrScrollbarOrientationState vertical)
]

{ #category : #'api - style' }
BrScrollbarOrientationLook >> vertical: aBlock [
	aBlock value: self vertical
]
