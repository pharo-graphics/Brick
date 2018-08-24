Class {
	#name : #BrActionGroup,
	#superclass : #BlElement,
	#category : 'Brick-Experimental-Toolbar'
}

{ #category : #'as yet unclassified' }
BrActionGroup >> initialize [
	super initialize.
	self layout: BlLinearLayout horizontal
]
