"
to be removed ?
"
Class {
	#name : #BrStyleTransition,
	#superclass : #BrStyle,
	#category : 'Brick-Style-Util'
}

{ #category : #accessing }
BrStyleTransition >> transition [
	^ declaration
]

{ #category : #accessing }
BrStyleTransition >> transition: anObject [
	declaration := anObject
]
