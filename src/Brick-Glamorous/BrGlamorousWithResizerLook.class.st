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
	resizer := self newResizer.
	changes
		add: (#(content) asBrLookChildAddChangeWithValue: [ resizer ])
]

{ #category : #initialization }
BrGlamorousWithResizerLook >> initializeLook [
	self flag: 'resizer is added/removed by look, nothing to rollback'.
	super initializeLook.
	resizer target: self widgetContent
]

{ #category : #initialization }
BrGlamorousWithResizerLook >> newResizer [
	^ BrResizer new
		look: BrGlamorousResizerLook;
		elevation: (BlRelativeElevation elevation: 1000);
		constraintsDo: [ :c | c ignoreByLayout ]
]
