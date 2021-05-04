"
I am a ${class:BrStyleCommonLook}$.
I provide API to define how a ${class:BrSimpleList}$ should look like when in vertical or horizontal state.
"
Class {
	#name : #BrListOrientationAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Brick-List - Look'
}

{ #category : #'api - style' }
BrListOrientationAptitude >> horizontal [
	^ self styleFor: (BrListOrientationState horizontal)
]

{ #category : #'api - style' }
BrListOrientationAptitude >> horizontal: aBlock [
	aBlock value: self horizontal
]

{ #category : #'api - style' }
BrListOrientationAptitude >> vertical [
	^ self styleFor: (BrListOrientationState vertical)
]

{ #category : #'api - style' }
BrListOrientationAptitude >> vertical: aBlock [
	aBlock value: self vertical
]
