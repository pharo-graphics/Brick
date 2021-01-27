Class {
	#name : #BrThemeExamples,
	#superclass : #Object,
	#category : #'Brick-Theme-Examples'
}

{ #category : #accessing }
BrThemeExamples >> automaticLookElementBased [
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

{ #category : #accessing }
BrThemeExamples >> automaticLookLookBased [
	<gtExample>
	| container parent child1 child2 |
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 5);
		yourself.
	parent := BlElement new
		themeStrategy: (BrThemeExplicitStrategy theme: BrThemeExampleMapped new);
		look: BrThemeableLook new;
		yourself.
	child1 := BlElement new
		look: BrThemeableLook new;
		yourself.
	child2 := BlElement new
		look: BrThemeableLook new;
		yourself.
	container addChild: parent.
	parent addChild: child1.
	parent addChild: child2.
	^ container
]
