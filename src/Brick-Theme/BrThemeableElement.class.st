Class {
	#name : #BrThemeableElement,
	#superclass : #BlElement,
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #accessing }
BrThemeableElement >> onAddedToSceneGraph [
	self look ifNil: [ self look: (self theme newLookFor: self) ].
	super onAddedToSceneGraph
]
