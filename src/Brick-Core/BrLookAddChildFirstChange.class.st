"
BrLookAddChildFirstChange is the same as BrLookAddChildChange, but the element is added as the first child, instead of the last.
"
Class {
	#name : #BrLookAddChildFirstChange,
	#superclass : #BrLookAddChildChange,
	#category : #'Brick-Core-Changes'
}

{ #category : #initialization }
BrLookAddChildFirstChange >> writeOn: aLook value: anObject [
	| container |
	container := self containerOn: aLook.
	^ anObject
		ifNil: [ container removeChild: child ]
		ifNotNil: [ child := anObject.
			container addChildFirst: anObject ]
]
