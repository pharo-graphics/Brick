Class {
	#name : #BrMaterialToolbarLook,
	#superclass : #BrLook,
	#category : 'Brick-Material-Collection'
}

{ #category : #initialization }
BrMaterialToolbarLook >> initialize [
	super initialize.
	self add: BrMaterialRoundedLook.
	self add: BrMaterialToggleBackgroundLook.
	self add: BrShadowLook.
]
