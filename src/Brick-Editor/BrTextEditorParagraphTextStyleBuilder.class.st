Class {
	#name : #BrTextEditorParagraphTextStyleBuilder,
	#superclass : #Object,
	#traits : 'TSpFontDescriptor',
	#classTraits : 'TSpFontDescriptor classTrait',
	#instVars : [
		'fontSize',
		'familyName',
		'color'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #converting }
BrTextEditorParagraphTextStyleBuilder >> asFontStyleDuring: aBlock [
	^ SkiaFontStyle
		weight: (weight ifNil: [ SpartaFontWeight normal ]) value
		width: (SkiaFontStyleWidth fromSpartaStretch: (stretch ifNil: [ SpartaFontStretch normal ]))
		slant: (SkiaFontStyleSlant fromSpartaSlant: (style ifNil: [ SpartaFontSlant normal ]))
		during: aBlock
]

{ #category : #accessing }
BrTextEditorParagraphTextStyleBuilder >> color [
	^ color
]

{ #category : #accessing }
BrTextEditorParagraphTextStyleBuilder >> color: anObject [
	color := anObject
]

{ #category : #accessing }
BrTextEditorParagraphTextStyleBuilder >> familyName [
	^ familyName
]

{ #category : #accessing }
BrTextEditorParagraphTextStyleBuilder >> familyName: anObject [
	familyName := anObject
]

{ #category : #accessing }
BrTextEditorParagraphTextStyleBuilder >> fontSize [
	^ fontSize
]

{ #category : #accessing }
BrTextEditorParagraphTextStyleBuilder >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #testing }
BrTextEditorParagraphTextStyleBuilder >> hasCustomColor [
	^ color notNil
]

{ #category : #testing }
BrTextEditorParagraphTextStyleBuilder >> hasCustomFamilyName [
	^ familyName notNil
]

{ #category : #testing }
BrTextEditorParagraphTextStyleBuilder >> hasCustomFontSize [
	^ fontSize notNil
]

{ #category : #testing }
BrTextEditorParagraphTextStyleBuilder >> hasCustomFontStyle [
	^ stretch notNil or: [ style notNil or: [ weight notNil ] ]
]

{ #category : #initialization }
BrTextEditorParagraphTextStyleBuilder >> initialize [
	super initialize.
]

{ #category : #font }
BrTextEditorParagraphTextStyleBuilder >> monospace [
]

{ #category : #'api - attributes' }
BrTextEditorParagraphTextStyleBuilder >> named: anObject [
	self familyName: anObject
]

{ #category : #'api - attributes' }
BrTextEditorParagraphTextStyleBuilder >> paint: aBlPaint [
	self color: aBlPaint
]

{ #category : #font }
BrTextEditorParagraphTextStyleBuilder >> sansSerif [
]

{ #category : #font }
BrTextEditorParagraphTextStyleBuilder >> serif [
]

{ #category : #'api - attributes' }
BrTextEditorParagraphTextStyleBuilder >> size: aNumber [
	self fontSize: aNumber
]

{ #category : #'api - attributes' }
BrTextEditorParagraphTextStyleBuilder >> spacing: aNumber [
]
