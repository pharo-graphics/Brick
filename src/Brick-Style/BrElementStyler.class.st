Class {
	#name : #BrElementStyler,
	#superclass : #BrCssStyler,
	#category : 'Brick-Style-Styler'
}

{ #category : #'as yet unclassified' }
BrElementStyler class >> styleProperties [
	^ #(#backgroundColor #borderColor #borderWidth #boxShadow)
]

{ #category : #accessing }
BrElementStyler >> backgroundColor [
	^ self styleable background fill color asBrStyleValue
]

{ #category : #accessing }
BrElementStyler >> backgroundColor: anBlColorValue [
	anBlColorValue ifNil: [ ^ self styleable background: Color transparent ].
	self styleable background: anBlColorValue value
]

{ #category : #accessing }
BrElementStyler >> borderColor [
	^ self styleable border stroke paint color asBrStyleValue
]

{ #category : #accessing }
BrElementStyler >> borderColor: aBlColorValue [
	self styleable border: (self styleable border copyWithPaint: (aBlColorValue value ifNil: [ Color transparent ]))
]

{ #category : #accessing }
BrElementStyler >> borderWidth [
	self styleable border stroke width asBrStyleValue.
	
]

{ #category : #accessing }
BrElementStyler >> borderWidth: anBlValue [
	self styleable border: (self styleable border copyWithWidth: (anBlValue value ifNil: [ 0 ]))
]

{ #category : #'as yet unclassified' }
BrElementStyler >> boxShadow [
	^ nil asBrStyleValue
]

{ #category : #'as yet unclassified' }
BrElementStyler >> boxShadow: anBlArrayValue [
	| arr |
	anBlArrayValue ifNil: [ ^ self styleable effect: BlNullEffect new ].
	arr := anBlArrayValue value.
	self styleable effect: (BlDropShadowEffect new
				offset: arr first value @ arr second value;
				width: (arr at: 3) value;
				color: (arr at: 4) value;
				yourself)
]
