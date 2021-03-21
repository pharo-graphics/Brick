"
I am a ${class:BlElementUniqueState}$.
I define whether a ${class:BrSimpleList}$ should be displayed either vertically or horizontally.
"
Class {
	#name : #BrListOrientationState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-List - State'
}

{ #category : #factory }
BrListOrientationState class >> horizontal [
	^ BrListHorizontalState uniqueInstance
]

{ #category : #factory }
BrListOrientationState class >> vertical [
	^ BrListVerticalState uniqueInstance
]

{ #category : #testing }
BrListOrientationState >> isHorizontal [
	^ self = self class horizontal
]

{ #category : #testing }
BrListOrientationState >> isVertical [
	^ self = self class vertical
]

{ #category : #accessing }
BrListOrientationState >> name [
	^ 'orientation'
]

{ #category : #printing }
BrListOrientationState >> printOn: aStream [
	aStream
		nextPutAll: 'list ';
		nextPutAll: self name;
		nextPutAll: ' orientation'
]

{ #category : #accessing }
BrListOrientationState >> priority [
	^ UserPriority
]

{ #category : #testing }
BrListOrientationState >> shouldPropagateToChildren [
	^ false
]

{ #category : #accessing }
BrListOrientationState >> type [
	^ BrListOrientationState
]
