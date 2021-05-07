"
I am a look of an iconified material toggle button.

I don't apply any shadows to simplify integration into a toggle group which has its own shadow on the widget
"
Class {
	#name : #BrMaterialToggleIconifiedAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'backgroundLook',
		'icon'
	],
	#category : #'Brick-Material-Toggles'
}

{ #category : #accessing }
BrMaterialToggleIconifiedAptitude >> background [
	^ backgroundLook
]

{ #category : #accessing }
BrMaterialToggleIconifiedAptitude >> icon: anElement [
	icon icon: anElement
]

{ #category : #initialization }
BrMaterialToggleIconifiedAptitude >> initialize [
	super initialize.

	self addAll: {
		"for the roudned corners"
		BrMaterialRoundedAptitude.
		"for basic layout parameters"
		BrMaterialButtonLayoutAptitude.
		"for toggleable background"
		backgroundLook := BrMaterialToggleBackgroundAptitude new.
		"for the icon"
		icon := BrIconAptitude new.
		"for the shadow"
		BrShadowAptitude }.
]
