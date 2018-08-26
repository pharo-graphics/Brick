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

{ #category : #accessing }
BrGlamorousColors class >> hoveredButtonBorderColor [
	^ HoveredButtonBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> hoveredButtonBorderColor: anObject [
	HoveredButtonBorderColor := anObject
]

{ #category : #initialization }
BrGlamorousColors class >> initialize [
	LightBorderColor := Color fromHexString: #d9d9d9.
	PrimaryBorderColor := Color fromHexString: #'45abfe'.

	ButtonBorderColor := LightBorderColor.
	HoveredButtonBorderColor := PrimaryBorderColor.

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

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor [
	^ PrimaryBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor: anObject [
	PrimaryBorderColor := anObject
]
