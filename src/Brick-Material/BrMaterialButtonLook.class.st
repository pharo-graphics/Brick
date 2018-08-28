Class {
	#name : #BrMaterialButtonLook,
	#superclass : #BrLook,
	#category : #'Brick-Material-Buttons'
}

{ #category : #initialization }
BrMaterialButtonLook >> initialize [
	super initialize.
	
	self addAll: { 
		BrMaterialButtonLayoutLook new.
		BrMaterialRoundedLook new.
		"for toggleable background"
		BrMaterialToggleBackgroundLook.
		"for the label"
		BrLabelLook.
		"for the shadow"
		BrShadowLook
	}
]
