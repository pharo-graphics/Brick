Class {
	#name : #BrThemeExamples,
	#superclass : #Object,
	#category : #'Brick-Theme-Examples'
}

{ #category : #accessing }
BrThemeExamples >> automaticLooks [
	<gtExample>
	| container parent child1 child2 |
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 5);
		yourself.
	parent := BrThemeableElement new
		themeStrategy: (BrThemeExplicitStrategy theme: BrThemeExampleMapped new);
		yourself.
	child1 := BrThemeableElement new.
	child2 := BrThemeableElement new.
	container addChild: parent.
	parent addChild: child1.
	parent addChild: child2.
	^ container
]
