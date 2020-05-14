Class {
	#name : #BrScrollbarOrientationState,
	#superclass : #BrInteractionState,
	#classInstVars : [
		'vertical',
		'horizontal'
	],
	#category : #'Brick-Scrollbar - State'
}

{ #category : #'instance creation' }
BrScrollbarOrientationState class >> horizontal [
	^ horizontal ifNil: [ horizontal := BrScrollbarHorizontalState new ]
]

{ #category : #'instance creation' }
BrScrollbarOrientationState class >> vertical [
	^ vertical ifNil: [ vertical := BrScrollbarVerticalState new ]
]

{ #category : #testing }
BrScrollbarOrientationState >> isHorizontal [
	^ self = self class horizontal
]

{ #category : #testing }
BrScrollbarOrientationState >> isVertical [
	^ self = self class vertical
]
