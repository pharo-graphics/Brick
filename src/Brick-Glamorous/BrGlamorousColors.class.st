Class {
	#name : #BrGlamorousColors,
	#superclass : #SharedPool,
	#classVars : [
		'ButtonBorderColor',
		'EditorBorderColor',
		'FocusedEditorBorderColor',
		'HoveredButtonBorderColor',
		'LightBorderColor',
		'PrimaryBorderColor'
	],
	#category : 'Brick-Glamorous'
}

{ #category : #initialization }
BrGlamorousColors class >> initialize [
	LightBorderColor := Color fromHexString: #d9d9d9.
	PrimaryBorderColor := Color fromHexString: #'45abfe'.

	ButtonBorderColor := LightBorderColor.
	HoveredButtonBorderColor := PrimaryBorderColor.

	EditorBorderColor := LightBorderColor.
	FocusedEditorBorderColor := PrimaryBorderColor
]
