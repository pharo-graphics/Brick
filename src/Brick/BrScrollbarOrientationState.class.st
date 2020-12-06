Class {
	#name : #BrScrollbarOrientationState,
	#superclass : #BlElementUniqueState,
	#classInstVars : [
		'vertical',
		'horizontal'
	],
	#category : #'Brick-Scrollbar - State'
}

{ #category : #'instance creation' }
BrScrollbarOrientationState class >> horizontal [
	^ BrScrollbarHorizontalState uniqueInstance
]

{ #category : #'instance creation' }
BrScrollbarOrientationState class >> vertical [
	^ BrScrollbarVerticalState uniqueInstance
]

{ #category : #testing }
BrScrollbarOrientationState >> isHorizontal [
	^ self = self class horizontal
]

{ #category : #testing }
BrScrollbarOrientationState >> isVertical [
	^ self = self class vertical
]

{ #category : #accessing }
BrScrollbarOrientationState >> priority [
	^ UserPriority
]

{ #category : #accessing }
BrScrollbarOrientationState >> shouldPropagateToChildren [
	^ true
]

{ #category : #accessing }
BrScrollbarOrientationState >> type [
	^ BrScrollbarOrientationState
]
