"
I am a look of an iconified material toggle button.

I don't apply any shadows to simplify integration into a toggle group which has its own shadow on the widget
"
Class {
	#name : #BrMaterialToggleIconifiedLook,
	#superclass : #BrLook,
	#instVars : [
		'backgroundLook',
		'icon'
	],
	#category : 'Brick-Material-Collection'
}

{ #category : #accessing }
BrMaterialToggleIconifiedLook >> background [
	^ backgroundLook
]

{ #category : #accessing }
BrMaterialToggleIconifiedLook >> icon: anElement [
	icon icon: anElement
]

{ #category : #initialization }
BrMaterialToggleIconifiedLook >> initialize [
	super initialize.

	self addAll: {
		"for the roudned corners"
		BrMaterialRoundedLook.
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for toggleable background"
		backgroundLook := BrMaterialToggleBackgroundLook new.
		"for the icon"
		icon := BrIconLook new.
		"for the shadow"
		BrShadowLook }.
]
