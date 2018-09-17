Class {
	#name : #BrGlamorousLabelLook,
	#superclass : #BrLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousLabelLook >> initialize [
	super initialize.

	self
		fontSize: 14;
		weight: 400;
		fontName: 'Source Sans Pro'.

	self labelDo: [ :aLabelElement | aLabelElement boundsBaseline ]
]
