Class {
	#name : #BrGlamorousListWithScrollbarLook,
	#superclass : #BrGlamorousWithVerticalScrollbarLook,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #'api - orientation' }
BrGlamorousListWithScrollbarLook >> beHorizontal [
	scrollbar beHorizontal
]

{ #category : #'api - orientation' }
BrGlamorousListWithScrollbarLook >> beVertical [
	scrollbar beVertical
]

{ #category : #initialization }
BrGlamorousListWithScrollbarLook >> initialize [
	super initialize.

	self add: (BrListOrientationLook new
		horizontal: [ :aStyle | aStyle do: [ :aWidget | self beHorizontal ] ];
		vertical: [ :aStyle | aStyle do: [ :aWidget | self beVertical ] ])
]
