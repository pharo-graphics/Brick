Class {
	#name : #BrThemeStrategy,
	#superclass : #Object,
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #accessing }
BrThemeStrategy >> themeFor: anElement [
	"Answers the theme of its element."

	self subclassResponsibility
]
