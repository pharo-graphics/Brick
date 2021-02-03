Class {
	#name : #BrThemeExamples,
	#superclass : #Object,
	#category : #'Brick-Theme-Examples'
}

{ #category : #accessing }
BrThemeExamples >> automaticLookElementBased [
	<gtExample>
	| container parent child1 child2 |
	container := self container.
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
	container := self container.
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

{ #category : #accessing }
BrThemeExamples >> container [
	^ BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		yourself
]

{ #category : #accessing }
BrThemeExamples >> list [
	<gtExample>
	| list a b |
	a := BrThemeExampleMapped new
		at: BrButton put: #newGlamorousButtonLookFor:;
		yourself.
	b := BrThemeExampleMapped new
		at: BrButton put: #newMaterialButtonLookFor:;
		yourself.
	list := BrSimpleList vertical
		theme: a;
		itemType: [ :aFactory :anItem :anIndex | Integer ];
		itemStencil: [ :anItemType | 
			BrButton new
				look: BrThemeableLook;
				action: [ list theme == a
						ifTrue: [ list theme: b ]
						ifFalse: [ list theme: a ] ];
				yourself ];
		itemDataBinder: [ :anElement :anItem :anIndex | anElement label: anItem asString ];
		items: (1 to: 1000);
		yourself.
	^ list
]

{ #category : #accessing }
BrThemeExamples >> listUnthemed [
	<gtExample>
	| list |
	list := BrSimpleList vertical
		itemType: [ :aFactory :anItem :anIndex | Integer ];
		itemStencil: [ :anItemType | 
			BrButton new
				look: BrGlamorousButtonWithLabelLook;
				yourself ];
		itemDataBinder: [ :anElement :anItem :anIndex | anElement label: anItem asString ];
		items: (1 to: 1000);
		yourself.
	^ list
]
