Class {
	#name : #BrAnchoredStrategy,
	#superclass : #Object,
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredStrategy >> availableBoundsIn: aReferenceElement forPreferredExtent: aPoint [
	self subclassResponsibility
]

{ #category : #accessing }
BrAnchoredStrategy >> invalidate: anElement forPreferredExtent: aPoint [
	self subclassResponsibility
]
