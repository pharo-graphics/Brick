Class {
	#name : #BrTextElementStyler,
	#superclass : #BrElementStyler,
	#category : 'Brick-Style-Styler'
}

{ #category : #'as yet unclassified' }
BrTextElementStyler class >> styleProperties [
	^ super styleProperties , #(#fontSize #color #fontFamily)
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> color [
	^ self backgroundColor asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> color: anBlValue [
	self backgroundColor:anBlValue
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> fontColor [
	^ self color asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> fontColor: anBlValue [
	self color: anBlValue value
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> fontFamily [
	self styleable font familyName asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> fontFamily: anBlValue [
	self styleable
		font: (LogicalFont familyName: (anBlValue value ifNil: [ StandardFonts defaultFont familyName ]) pointSize: self styleable font pointSize)
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> fontSize [
	self styleable font pointSize asBrPt
]

{ #category : #'as yet unclassified' }
BrTextElementStyler >> fontSize: anBlValue [
	self styleable
		font: (LogicalFont familyName: self styleable font familyName pointSize: (anBlValue value ifNil: [ StandardFonts defaultFont pointSize ]))
]
