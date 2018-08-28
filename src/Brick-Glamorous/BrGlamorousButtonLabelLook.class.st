"
I define how a label looks inside of the glamorous button, for example font size, family name, weight etc
"
Class {
	#name : #BrGlamorousButtonLabelLook,
	#superclass : #BrLabelLook,
	#category : 'Brick-Glamorous-Buttons'
}

{ #category : #hooks }
BrGlamorousButtonLabelLook >> activationChanged: aBoolean [
	aBoolean
		ifTrue: [ self buttonEnabled ]
		ifFalse: [ self buttonDisabled ]
]

{ #category : #hooks }
BrGlamorousButtonLabelLook >> buttonDisabled [
	self foreground: (Color black alpha: 0.25)
]

{ #category : #hooks }
BrGlamorousButtonLabelLook >> buttonEnabled [
	self foreground: (Color black alpha: 0.65)
]

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initialize [
	super initialize.
	
	self
		fontSize: 14;
		weight: 400;
		fontName: 'Source Sans Pro'.

	self labelDo: [ :aLabelElement | aLabelElement boundsBaseline ]
]

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrActivationChanged do: [ :anEvent | self activationChanged: anEvent isActivated ]
]

{ #category : #initialization }
BrGlamorousButtonLabelLook >> initializeRequests [
	super initializeRequests.

	self activationChanged: (self request: BrActivationRequest new) isActivated
]
