Class {
	#name : #BrMaterialButtonAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Material-Buttons'
}

{ #category : #initialization }
BrMaterialButtonAptitude >> initialize [
	super initialize.
	
	self addAll: { 
		BrMaterialButtonLayoutAptitude new.
		BrMaterialRoundedAptitude new.
		"for toggleable background"
		BrMaterialToggleBackgroundAptitude.
		"for the label"
		BrTextLabelAptitude.
		"for the shadow"
		BrShadowAptitude
	}
]
