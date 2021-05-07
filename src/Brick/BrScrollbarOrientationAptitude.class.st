Class {
	#name : #BrScrollbarOrientationAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #'api - style' }
BrScrollbarOrientationAptitude >> horizontal [
	^ self styleFor: (BrScrollbarOrientationState horizontal)
]

{ #category : #'api - style' }
BrScrollbarOrientationAptitude >> horizontal: aBlock [
	aBlock value: self horizontal
]

{ #category : #'api - style' }
BrScrollbarOrientationAptitude >> vertical [
	^ self styleFor: (BrScrollbarOrientationState vertical)
]

{ #category : #'api - style' }
BrScrollbarOrientationAptitude >> vertical: aBlock [
	aBlock value: self vertical
]
