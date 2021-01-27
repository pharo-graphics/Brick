Class {
	#name : #BrThemeExampleMapped,
	#superclass : #BrThemeMapped,
	#category : #'Brick-Theme-Examples-Brick-Theme-Examples'
}

{ #category : #accessing }
BrThemeExampleMapped >> initialize [
	super initialize.
	self at: BlElement put: #newDefaultLookFor:
]

{ #category : #accessing }
BrThemeExampleMapped >> newDefaultLookFor: anElement [
	^ BrThemeExampleLook new
]
