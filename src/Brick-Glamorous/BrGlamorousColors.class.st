Class {
	#name : #BrGlamorousColors,
	#superclass : #SharedPool,
	#classVars : [
		'ActiveColor',
		'ButtonBorderColor',
		'ButtonTextColor',
		'DefaultButtonBackgroundColor',
		'DisabledButtonBackgroundColor',
		'DisabledButtonBorderColor',
		'DisabledButtonTextColor',
		'EditorBorderColor',
		'FocusedEditorBorderColor',
		'HoveredButtonBorderColor',
		'HoveredButtonTextColor',
		'LightBorderColor',
		'PressedButtonBorderColor',
		'PressedButtonTextColor',
		'PrimaryBorderColor'
	],
	#category : #'Brick-Glamorous'
}

{ #category : #'button - background' }
BrGlamorousColors class >> defaultButtonBackgroundColor [
	^ DefaultButtonBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> defaultButtonBackgroundColor: anObject [
	DefaultButtonBackgroundColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> defaultButtonBorderColor [
	^ ButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> defaultButtonBorderColor: anObject [
	ButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> defaultButtonTextColor [
	^ ButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> defaultButtonTextColor: anObject [
	ButtonTextColor := anObject
]

{ #category : #'button - background' }
BrGlamorousColors class >> disabledButtonBackgroundColor [
	^ DisabledButtonBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> disabledButtonBackgroundColor: anObject [
	DisabledButtonBackgroundColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> disabledButtonBorderColor [
	^ DisabledButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> disabledButtonBorderColor: anObject [
	DisabledButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> disabledButtonTextColor [
	^ DisabledButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> disabledButtonTextColor: anObject [
	DisabledButtonTextColor := anObject
]

{ #category : #accessing }
BrGlamorousColors class >> editorBorderColor [
	^ EditorBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> editorBorderColor: anObject [
	EditorBorderColor := anObject
]

{ #category : #accessing }
BrGlamorousColors class >> focusedEditorBorderColor [
	^ FocusedEditorBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> focusedEditorBorderColor: anObject [
	FocusedEditorBorderColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> hoveredButtonBorderColor [
	^ HoveredButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> hoveredButtonBorderColor: anObject [
	HoveredButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> hoveredButtonTextColor [
	^ HoveredButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> hoveredButtonTextColor: anObject [
	HoveredButtonTextColor := anObject
]

{ #category : #initialization }
BrGlamorousColors class >> initialize [
	LightBorderColor := Color fromHexString: #d9d9d9.
	PrimaryBorderColor := Color fromHexString: #'45abfe'.
	ActiveColor := Color fromHexString: #'096dd9'.

	"buttons - border"
	ButtonBorderColor := LightBorderColor.
	HoveredButtonBorderColor := PrimaryBorderColor.
	PressedButtonBorderColor := ActiveColor.
	DisabledButtonBorderColor := LightBorderColor.
	
	"buttons - background"
	DefaultButtonBackgroundColor := Color white.
	DisabledButtonBackgroundColor := Color fromHexString: #f5f5f5.

	"buttons - text"
	ButtonTextColor := Color black alpha: 0.65.
	HoveredButtonTextColor := PrimaryBorderColor.
	PressedButtonTextColor := ActiveColor.
	DisabledButtonTextColor := Color black alpha: 0.25.

	"editors"
	EditorBorderColor := LightBorderColor.
	FocusedEditorBorderColor := PrimaryBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> lightBorderColor [
	^ LightBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> lightBorderColor: anObject [
	LightBorderColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> pressedButtonBorderColor [
	^ PressedButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> pressedButtonBorderColor: anObject [
	PressedButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> pressedButtonTextColor [
	^ PressedButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> pressedButtonTextColor: anObject [
	PressedButtonTextColor := anObject
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor [
	^ PrimaryBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor: anObject [
	PrimaryBorderColor := anObject
]
