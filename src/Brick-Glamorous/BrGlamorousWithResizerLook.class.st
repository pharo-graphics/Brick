Class {
	#name : #BrGlamorousWithResizerLook,
	#superclass : #BrLook,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #initialization }
BrGlamorousWithResizerLook >> initialize [
	super initialize.

	resizer := self newResizer
]

{ #category : #initialization }
BrGlamorousWithResizerLook >> initializeLook [
	super initializeLook.
	
	self widgetContent addChild: resizer.
	resizer target: self widgetContent
]

{ #category : #initialization }
BrGlamorousWithResizerLook >> newResizer [
	^ BrResizer new
		look: BrGlamorousResizerLook;
		constraintsDo: [ :c | c ignoreByLayout ]
]
