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
	^ BrThemeExampleAptitude new
]

{ #category : #accessing }
BrThemeExampleMapped >> newGlamorousButtonLookFor: anElement [
	^ BrGlamorousButtonWithLabelAptitude new
]

{ #category : #accessing }
BrThemeExampleMapped >> newMaterialButtonLookFor: anElement [
	^ BrMaterialButtonAptitude new
]
