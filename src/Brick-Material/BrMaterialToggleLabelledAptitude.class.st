"
I am a look of a labelled material toggle button.

I don't apply any shadows to simplify integration into a toggle group which has its own shadow on the widget
"
Class {
	#name : #BrMaterialToggleLabelledAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Material-Toggles'
}

{ #category : #initialization }
BrMaterialToggleLabelledAptitude >> initialize [
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutAptitude.
		"for the roudned corners"
		BrMaterialRoundedAptitude.
		"for toggleable background"
		BrMaterialToggleBackgroundAptitude.
		"for the label"
		BrTextLabelAptitude.
		"for the shadow"
		BrShadowAptitude }
]
