Class {
	#name : #BrMdColor,
	#superclass : #Color,
	#instVars : [
		'colorName'
	],
	#category : 'Brick-Old'
}

{ #category : #defaults }
BrMdColor class >> blue [
	^ self color: #blue intensity: 500
]

{ #category : #blue }
BrMdColor class >> blue100 [
	^ self color: #blue intensity: 100
]

{ #category : #blue }
BrMdColor class >> blue200 [
	^ self color: #blue intensity: 200
]

{ #category : #blue }
BrMdColor class >> blue300 [
	^ self color: #blue intensity: 300
]

{ #category : #blue }
BrMdColor class >> blue400 [
	^ self color: #blue intensity: 400
]

{ #category : #blue }
BrMdColor class >> blue50 [
	^ self color: #blue intensity: 5à
]

{ #category : #blue }
BrMdColor class >> blue500 [
	^ self color: #blue intensity: 500
]

{ #category : #blue }
BrMdColor class >> blue600 [
	^ self color: #blue intensity: 600
]

{ #category : #blue }
BrMdColor class >> blue700 [
	^ self color: #blue intensity: 700
]

{ #category : #blue }
BrMdColor class >> blue800 [
	^ self color: #blue intensity: 800
]

{ #category : #blue }
BrMdColor class >> blue900 [
	^ self color: #blue intensity: 900
]

{ #category : #blue }
BrMdColor class >> color: aColorName intensity: aNumber [
	^ self colorMap color: aColorName asSymbol intensity: aNumber
]

{ #category : #'as yet unclassified' }
BrMdColor class >> colorMap [
	^ BrMdColorMap uniqueInstance
]

{ #category : #defaults }
BrMdColor class >> green [
	^ self color: #green intensity: 500
]

{ #category : #green }
BrMdColor class >> green100 [
	^ self color: #green intensity: 100
]

{ #category : #green }
BrMdColor class >> green200 [
	^ self color: #green intensity: 200
]

{ #category : #green }
BrMdColor class >> green300 [
	^ self color: #green intensity: 300
]

{ #category : #green }
BrMdColor class >> green400 [
	^ self color: #green intensity: 400
]

{ #category : #green }
BrMdColor class >> green50 [
	^ self color: #green intensity: 50
]

{ #category : #green }
BrMdColor class >> green500 [
	^ self color: #green intensity: 500
]

{ #category : #green }
BrMdColor class >> green600 [
	^ self color: #green intensity: 600
]

{ #category : #green }
BrMdColor class >> green700 [
	^ self color: #green intensity: 700
]

{ #category : #green }
BrMdColor class >> green800 [
	^ self color: #green intensity: 800
]

{ #category : #green }
BrMdColor class >> green900 [
	^ self color: #green intensity: 900
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey [
	^ self color: #grey intensity: 500
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey100 [
	^ self color: #grey intensity: 100
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey200 [
	^ self color: #grey intensity: 200
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey300 [
	^ self color: #grey intensity: 300
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey400 [
	^ self color: #grey intensity: 400
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey50 [
	^ self color: #grey intensity: 50
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey500 [
	^ self color: #grey intensity: 500
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey600 [
	^ self color: #grey intensity: 600
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey700 [
	^ self color: #grey intensity: 700
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey800 [
	^ self color: #grey intensity: 800
]

{ #category : #'as yet unclassified' }
BrMdColor class >> grey900 [
	^ self color: #grey intensity: 900
]

{ #category : #defaults }
BrMdColor class >> red [
	^ self color: #red intensity: 500
]

{ #category : #accessing }
BrMdColor >> colorName [
	^ colorName
]

{ #category : #accessing }
BrMdColor >> colorName: anObject [
	colorName := anObject
]

{ #category : #'as yet unclassified' }
BrMdColor >> printOn: aStream [
	| name |
	(name := self colorName).
	name ifNotNil: [ 
			^ aStream
				nextPutAll: 'Color ';
				nextPutAll: name ].
	^ super printOn: aStream
]
