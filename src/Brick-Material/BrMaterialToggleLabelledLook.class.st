"
I am a look of a labelled material toggle button.

I don't apply any shadows to simplify integration into a toggle group which has its own shadow on the widget
"
Class {
	#name : #BrMaterialToggleLabelledLook,
	#superclass : #BrLook,
	#category : #'Brick-Material-Toggles'
}

{ #category : #initialization }
BrMaterialToggleLabelledLook >> initialize [
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for the roudned corners"
		BrMaterialRoundedLook.
		"for toggleable background"
		BrMaterialToggleBackgroundLook.
		"for the label"
		BrTextLabelLook.
		"for the shadow"
		BrShadowLook }
]
