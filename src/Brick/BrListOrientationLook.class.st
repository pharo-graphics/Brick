"
I am a ${class:BrStyleCommonLook}$.
I provide API to define how a ${class:BrSimpleList}$ should look like when in vertical or horizontal state.
"
Class {
	#name : #BrListOrientationLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-List - Look'
}

{ #category : #'api - style' }
BrListOrientationLook >> horizontal [
	^ self styleFor: (BrListOrientationState horizontal)
]

{ #category : #'api - style' }
BrListOrientationLook >> horizontal: aBlock [
	aBlock value: self horizontal
]

{ #category : #'api - style' }
BrListOrientationLook >> vertical [
	^ self styleFor: (BrListOrientationState vertical)
]

{ #category : #'api - style' }
BrListOrientationLook >> vertical: aBlock [
	aBlock value: self vertical
]
