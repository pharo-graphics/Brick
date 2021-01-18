Class {
	#name : #BrThemeExplicitStrategy,
	#superclass : #BrThemeStrategy,
	#instVars : [
		'theme'
	],
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #'instance creation' }
BrThemeExplicitStrategy class >> theme: aTheme [
	^ self new
		theme: aTheme;
		yourself
]

{ #category : #accessing }
BrThemeExplicitStrategy >> theme: aTheme [
	theme := aTheme
]

{ #category : #accessing }
BrThemeExplicitStrategy >> themeFor: anElement [
	^ theme
]
