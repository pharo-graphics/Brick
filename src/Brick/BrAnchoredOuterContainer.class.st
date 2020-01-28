Class {
	#name : #BrAnchoredOuterContainer,
	#superclass : #BlElement,
	#category : #'Brick-Anchored - Support'
}

{ #category : #initialization }
BrAnchoredOuterContainer >> initialize [
	super initialize.
	self
		layout: BlFrameLayout new;
		constraintsDo: [ :c | c ignoreByLayout ];
		preventMouseEvents;
		clipChildren: false
]

{ #category : #'change reporting' }
BrAnchoredOuterContainer >> invalidRect: aBlBounds from: anElement [
	"Force redraw of whole element to allow its own geometry to redraw"

	^ super
		  invalidRect:
		  ((self invalidationBounds: BlBounds new) merge: aBlBounds)
		  from: anElement
]
