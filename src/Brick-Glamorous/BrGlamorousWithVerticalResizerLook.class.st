Class {
	#name : #BrGlamorousWithVerticalResizerLook,
	#superclass : #BrLook,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #initialization }
BrGlamorousWithVerticalResizerLook >> initialize [
	super initialize.

	resizer := BrResizer new
		beBottom;
		look: BrGlamorousResizerLook;
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored horizontal weight: 0.5 ]
]

{ #category : #initialization }
BrGlamorousWithVerticalResizerLook >> initializeLook [
	super initializeLook.
	
	self widgetContent addChild: resizer.
	resizer target: self widgetContent 
]
