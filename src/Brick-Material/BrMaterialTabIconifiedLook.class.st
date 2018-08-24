Class {
	#name : #BrMaterialTabIconifiedLook,
	#superclass : #BrLook,
	#category : 'Brick-Material-Collection'
}

{ #category : #initialization }
BrMaterialTabIconifiedLook >> initialize [
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for toggleable background"
		BrMaterialTabBackgroundLook.
		"for the icon"
		BrIconLook }.
]
