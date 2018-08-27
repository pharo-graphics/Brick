Class {
	#name : #BrPressModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'pressed'
	],
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrPressModel >> initialize [
	super initialize.
	
	pressed := false
]

{ #category : #testing }
BrPressModel >> isPressed [
	^ pressed
]

{ #category : #'mouse handlers' }
BrPressModel >> mouseDownEvent: anEvent [
	anEvent consumed: true.

	pressed := true
]

{ #category : #'mouse handlers' }
BrPressModel >> mouseUpEvent: anEvent [
	anEvent consumed: true.

	pressed := false
]

{ #category : #'as yet unclassified' }
BrPressModel >> notifyPressChanged [
	
]
