Class {
	#name : #BrLabeled,
	#superclass : #BrWidgetOld,
	#instVars : [
		'text',
		'icon',
		'fontColor',
		'fontSize',
		'fontFamily'
	],
	#category : 'Brick-Old'
}

{ #category : #'initialize-release' }
BrLabeled >> defaultSkin [
	^ BrLabeledSkin new
]

{ #category : #'as yet unclassified' }
BrLabeled >> defaultStyler [
	^ BrLabeledStyler on: self
]

{ #category : #'accessing styles' }
BrLabeled >> fontColor [
	^ self fontColorProperty value
]

{ #category : #'accessing styles' }
BrLabeled >> fontColor: aColor [
	self fontColorProperty value:aColor
]

{ #category : #'accessing properties' }
BrLabeled >> fontColorProperty [
	^ fontColor ifNil: [ fontColor := BlObjectProperty on: self named: #fontColor default: Color veryDarkGray ]
]

{ #category : #'accessing styles' }
BrLabeled >> fontFamily [
	^ self fontFamilyProperty value
]

{ #category : #'accessing styles' }
BrLabeled >> fontFamily: aString [
	self fontFamilyProperty value:aString
]

{ #category : #'accessing properties' }
BrLabeled >> fontFamilyProperty [
	^ fontFamily ifNil: [ fontFamily := BlObjectProperty on: self named:#fontFamily  default: StandardFonts defaultFont familyName  ].
	
]

{ #category : #'accessing styles' }
BrLabeled >> fontSize [
	^ self fontSizeProperty value
]

{ #category : #'accessing styles' }
BrLabeled >> fontSize: aNumber [
	self fontSizeProperty value: aNumber
]

{ #category : #'accessing properties' }
BrLabeled >> fontSizeProperty [
	^ fontSize ifNil: [ fontSize := BlObjectProperty on: self named: #fontSize default: 8 ]
]

{ #category : #'accessing styles' }
BrLabeled >> icon [
	^ self iconProperty value
]

{ #category : #'accessing styles' }
BrLabeled >> icon: anObject [
	self iconProperty value: anObject
]

{ #category : #'accessing properties' }
BrLabeled >> iconProperty [
	^ icon ifNil: [ icon := BlObjectProperty on: self named: #icon]
]

{ #category : #'accessing styles' }
BrLabeled >> text [
	^ self textProperty value
]

{ #category : #'accessing styles' }
BrLabeled >> text: anObject [
	self textProperty value: anObject
]

{ #category : #'accessing properties' }
BrLabeled >> textProperty [
	^ text ifNil: [ text := BlObjectProperty on: self named: #text ]
]
