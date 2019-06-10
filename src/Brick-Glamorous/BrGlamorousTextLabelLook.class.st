Class {
	#name : #BrGlamorousTextLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousTextLabelLook >> initialize [
	super initialize.

	self
		fontSize: 14;
		fontName: 'Source Sans Pro'
]
