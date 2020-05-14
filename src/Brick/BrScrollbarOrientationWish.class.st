Class {
	#name : #BrScrollbarOrientationWish,
	#superclass : #BrWish,
	#instVars : [
		'orientation'
	],
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #'instance creation' }
BrScrollbarOrientationWish class >> horizontal [
	^ self new orientation: BrScrollbarOrientationState horizontal
]

{ #category : #'instance creation' }
BrScrollbarOrientationWish class >> vertical [
	^ self new orientation: BrScrollbarOrientationState vertical
]

{ #category : #accessing }
BrScrollbarOrientationWish >> orientation [
	^ orientation
]

{ #category : #accessing }
BrScrollbarOrientationWish >> orientation: anObject [
	orientation := anObject
]
