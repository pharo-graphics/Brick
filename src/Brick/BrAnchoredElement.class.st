Class {
	#name : #BrAnchoredElement,
	#superclass : #BlElement,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'change reporting' }
BrAnchoredElement >> invalidRect: aBlBounds from: anElement [
	^ super
		invalidRect: ((self invalidationBounds: BlBounds new) merge: aBlBounds)
		from: anElement
]
