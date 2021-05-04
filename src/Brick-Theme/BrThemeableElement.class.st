Class {
	#name : #BrThemeableElement,
	#superclass : #BlElement,
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #accessing }
BrThemeableElement >> onAddedToSceneGraph [
	self aptitude ifNil: [ self aptitude: (self theme newLookFor: self) ].
	super onAddedToSceneGraph
]
