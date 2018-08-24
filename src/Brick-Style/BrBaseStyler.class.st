Class {
	#name : #BrBaseStyler,
	#superclass : #BrCssStyler,
	#category : 'Brick-Style-Styler'
}

{ #category : #'as yet unclassified' }
BrBaseStyler class >> styleProperties [
	^ #(#backgroundColor #borderColor #borderWidth #boxShadow)
]

{ #category : #accessing }
BrBaseStyler >> backgroundColor [
	 ^ self styleable backgroundColor asBrStyleValue
]

{ #category : #accessing }
BrBaseStyler >> backgroundColor: anBlColorValue [
	anBlColorValue ifNil: [ ^ self styleable backgroundColor: Color transparent ].
	"self styleable backgroundColor: anBlColorValue value."
	anBlColorValue applyOn: self styleable property:#backgroundColor.
]

{ #category : #accessing }
BrBaseStyler >> borderColor [
	^ self styleable borderColor asBrStyleValue
]

{ #category : #accessing }
BrBaseStyler >> borderColor: anBlColorValue [
	anBlColorValue ifNil: [ ^ self styleable borderColor: Color transparent ].
	anBlColorValue applyOn: self styleable property: #borderColor
]

{ #category : #accessing }
BrBaseStyler >> borderWidth [
	^ self styleable borderWidth asBrStyleValue
]

{ #category : #accessing }
BrBaseStyler >> borderWidth: anBlValue [
	anBlValue ifNil: [ ^ self styleable borderWidth: 0 ].
	self styleable borderWidth: anBlValue value
]

{ #category : #'as yet unclassified' }
BrBaseStyler >> boxShadow [
	^ nil asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrBaseStyler >> boxShadow: anBlArrayValue [
	| arr |
	anBlArrayValue ifNil: [ ^ self styleable effect: BlNullEffect new ].
	arr := anBlArrayValue value.
	self styleable effect: (BlDropShadowEffect new
				offset: arr first value @ arr second value;
				width: (arr at: 3) value;
				color: (arr at: 4) value;
				yourself)
]
