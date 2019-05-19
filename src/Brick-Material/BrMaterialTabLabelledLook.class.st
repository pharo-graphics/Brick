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
	self
		addAll:
			{BrMaterialButtonLayoutLook.
			"for toggleable background"
			BrMaterialTabBackgroundLook.
			"for the label"
			(label := BrTextLabelLook new)}.
	"for basic layout parameters"
	self
		addChange:
			(BrLookChange new
				up: [ :e | label thin ];
				down: [ :e |  ];
				yourself)
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
