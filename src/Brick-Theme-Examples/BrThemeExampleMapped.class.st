Class {
	#name : #BrThemeExampleMapped,
	#superclass : #BrThemeMapped,
	#category : #'Brick-Theme-Examples-Brick-Theme-Examples'
}

{ #category : #accessing }
BrThemeExampleMapped >> initialize [
	super initialize.
	self at: BrButton put: #newGlamorousButtonLookFor:
]

{ #category : #accessing }
BrThemeExampleMapped >> newDefaultLookFor: anElement [
	^ BrThemeExampleLook new
]

{ #category : #accessing }
BrThemeExampleMapped >> newGlamorousButtonLookFor: anElement [
	^ BrGlamorousButtonWithLabelLook new
]

{ #category : #accessing }
BrThemeExampleMapped >> newMaterialButtonLookFor: anElement [
	^ BrMaterialButtonLook new
]
