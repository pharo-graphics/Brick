Class {
	#name : #BrLabeledStyler,
	#superclass : #BrBaseStyler,
	#category : 'Brick-Style-Styler'
}

{ #category : #'as yet unclassified' }
BrLabeledStyler class >> styleProperties [
	^ super styleProperties , #(#fontSize #color #fontFamily)
]

{ #category : #accessing }
BrLabeledStyler >> color [
	^ self styleable fontColor asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrLabeledStyler >> color: anBlValue [
	anBlValue ifNil: [ ^ self styleable fontColor: Color black ].
	self styleable fontColor: anBlValue value
]

{ #category : #'as yet unclassified' }
BrLabeledStyler >> fontColor [
	^ self color
]

{ #category : #'as yet unclassified' }
BrLabeledStyler >> fontColor: anBlValue [
	self color: anBlValue value
]

{ #category : #'accessing styles' }
BrLabeledStyler >> fontFamily [
	^ self styleable fontFamily asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrLabeledStyler >> fontFamily: anBlValue [
	anBlValue ifNil: [ ^ self styleable fontFamily: StandardFonts defaultFont familyName].
	self styleable fontFamily: anBlValue value
]

{ #category : #'font description' }
BrLabeledStyler >> fontSize [
	^ self styleable pointSize asBrPt
]

{ #category : #'as yet unclassified' }
BrLabeledStyler >> fontSize: anBlValue [
	anBlValue ifNil: [ ^ self styleable fontFamily: StandardFonts defaultFont pointSize ].
	self styleable fontSize: anBlValue value
]
