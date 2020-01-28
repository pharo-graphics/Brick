Class {
	#name : #BrAnchoredElement,
	#superclass : #BlElement,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'change reporting' }
BrAnchoredElement >> invalidRect: aBlBounds from: anElement [
	"Force redraw of whole element to allow its own geometry to redraw"

	^ super
		  invalidRect:
		  ((self invalidationBounds: BlBounds new) merge: aBlBounds)
		  from: anElement
]
