Class {
	#name : #BrLabeledSkin,
	#superclass : #BrSkinOld,
	#instVars : [
		'graphic',
		'text'
	],
	#category : 'Brick-Old'
}

{ #category : #initialization }
BrLabeledSkin >> defaultLayout [
	^ BlLinearLayout horizontal alignCenter
]

{ #category : #'change reporting' }
BrLabeledSkin >> fontChanged [	
	text text: (text text attributes: {
		BrFontFamilyAttribute named: widget fontFamily.
		BrFontSizeAttribute size: widget fontSize.
		BrTextForegroundAttribute paint: widget fontColor
	})
]

{ #category : #'as yet unclassified' }
BrLabeledSkin >> graphicChanged [
	graphic := widget icon asElement.
	graphic styleClass: #icon.
	self updateChildren
]

{ #category : #initialization }
BrLabeledSkin >> initializeSkin [
	super initializeSkin.

	text := BlTextElement new
	 	styleClass: #text;
		zIndex: 20.
	
	widget constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].

	widget textProperty onChangedDo: [ self textChanged ].
	widget iconProperty onChangedDo: [ self graphicChanged ].
	widget fontFamilyProperty onChangedDo: [ self fontChanged ].
	widget fontSizeProperty onChangedDo: [ self fontChanged ].
	widget fontColorProperty onChangedDo: [ self fontChanged ]
]

{ #category : #'event handling' }
BrLabeledSkin >> textChanged [
	text text: widget text.
	self fontChanged.
	self updateChildren
]

{ #category : #updating }
BrLabeledSkin >> updateChildren [
	| children |
	
	children := OrderedCollection new.
	graphic ifNotNil: [ children add: graphic ].

	children add: text.
	widget removeChildren.
	widget addChildren: children
]
