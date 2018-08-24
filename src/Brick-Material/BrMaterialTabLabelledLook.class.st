Class {
	#name : #BrMaterialTabLabelledLook,
	#superclass : #BrTabLook,
	#instVars : [
		'label'
	],
	#category : 'Brick-Material-Collection'
}

{ #category : #initialization }
BrMaterialTabLabelledLook >> initialize [
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for toggleable background"
		BrMaterialTabBackgroundLook.
		"for the label"
		label := BrLabelLook new }
]

{ #category : #initialization }
BrMaterialTabLabelledLook >> initializeLook [
	super initializeLook.
	
	label thin
]

{ #category : #accessing }
BrMaterialTabLabelledLook >> labelLook [
	<return: #BrLabelLook>

	^ label
]

{ #category : #hooks }
BrMaterialTabLabelledLook >> tabDisabled [
	super tabDisabled.

	label foreground: Color gray
]

{ #category : #hooks }
BrMaterialTabLabelledLook >> tabEnabled [
	super tabEnabled.

	label foreground: Color black
]
