"
!Brick Theme
The main responsibility of a theme is to decide which look to apply to an element. A theme knows how to create the looks it is composed of, it acts as a factory. The looks on the other hand, can delegate back to their respective theme for properties like font size, colors, etc. It is the responsibility of a look to decide which properties it allows to be defined by the theme, and which not. The general rule of thumb is, that non-interactive, visual properties should be delegated to the theme.
!!How does an element get its theme?
The basic Bloc element is extended to have a strategy that decides how it should be themed. Currently, there are three different strategies:
 - ${class:BrInheritThemeStrategy}$ delegates the decision of its theme to its parent element (default)
 - ${class:BrExplicitThemeStrategy}$ allows to set an explicit theme on an element
 - ${class:BrGlobalThemeStrategy}$ looks up the theme from a global system property (default for root element of a ${class:BlSpace}$)
As an effect of these constraints, when Brick widgets are added to a scene, without modifying the default theming behavior, each widget inherits the theme from its parent, resulting in each widget using the theme of the space's root, which is the global default (see example ${example:name=BrThemeExamples>>#default}$).
!!How does a theme select a look?
Whenever a Brick widget is added to the scene, it checks if it already has a look or not. If it already has a look, the theme does not interfere. If the widget does not have a look, it asks its theme for one. A theme then creates a look and applies it on the element in the method ${method:name=BrTheme>>#createAndApplyLookOn:}$.

TODO add visualization of delegation
TODO add theme instance variable to brlook
TODO add element extensions, theme, themeStrategy





"
Class {
	#name : #BrTheme,
	#superclass : #Object,
	#classInstVars : [
		'global'
	],
	#category : #'Brick-Theme'
}

{ #category : #accessing }
BrTheme class >> global [
	^ global ifNil: [ global := self new ]
]
