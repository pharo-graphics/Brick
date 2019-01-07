Class {
	#name : #BrGlamorousListLabelLook,
	#superclass : #BrGlamorousLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousListLabelLook >> initialize [
	super initialize.

	labelElement padding: (BlInsets top: 3 bottom: 3).
]
