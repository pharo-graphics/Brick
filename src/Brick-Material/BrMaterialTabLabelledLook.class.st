Class {
	#name : #BrMaterialTabLabelledLook,
	#superclass : #BrTabLook,
	#instVars : [
		'label'
	],
	#category : #'Brick-Material-Tabs - Support'
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
		label := BrTextLabelLook new }
]

{ #category : #initialization }
BrMaterialTabLabelledLook >> initializeLook [
	super initializeLook.
	
	label thin
]

{ #category : #accessing }
BrMaterialTabLabelledLook >> labelLook [
	<return: #BrTextLabelLook>

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
