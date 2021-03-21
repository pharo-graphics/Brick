Class {
	#name : #BrDevScripterStepElement,
	#superclass : #BlElement,
	#instVars : [
		'labelElement',
		'targetElement',
		'statusElement'
	],
	#category : #'Brick-DevTool'
}

{ #category : #'instance creation' }
BrDevScripterStepElement class >> newFromStep: aBlDevScripterStep [
	^ self new initializeFromStep: aBlDevScripterStep
]

{ #category : #initialization }
BrDevScripterStepElement >> initialize [
	| contents |
	super initialize.
	self 
		layout: BlLinearLayout horizontal;
		look: BrShadowLook;
		zIndex: 10;
		background: Color white;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ].
	contents := BlElement new
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c padding: (BlInsets all: 5) ].
	self initializeStatusElement.
	self initializeLabelElement.
	self initializeTargetElement.
	self addChild: statusElement as: #status.
	self addChild: contents.
	contents addChild: labelElement as: #label.
	contents addChild: targetElement as: #target.
]

{ #category : #initialization }
BrDevScripterStepElement >> initializeFromStep: aBlDevScripterStep [
	| aStepText aTargetStep |
	statusElement background: aBlDevScripterStep stateColor.
	aStepText := aBlDevScripterStep gtDisplayText foreground: Color black.
	labelElement text: aStepText.
	aTargetStep := aBlDevScripterStep realTarget gtDisplayText 
		foreground: Color gray;
		fontSize: 10.
	targetElement text: aTargetStep.
]

{ #category : #initialization }
BrDevScripterStepElement >> initializeLabelElement [
	labelElement := BrLabel new 
		zIndex: 10;
		look: BrGlamorousLabelLook;
		addEventHandlerOn: BlClickEvent do: [ :anEvent | BlEvent fireEvent: anEvent target: self ];
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent. ];
		text: 'Step' asRopedText
]

{ #category : #accessing }
BrDevScripterStepElement >> initializeStatusElement [
	statusElement := BrVerticalPane new vMatchParent; hExact: 15; background: Color white
]

{ #category : #initialization }
BrDevScripterStepElement >> initializeTargetElement [
	targetElement := BrLabel new
		look: (BrGlamorousLabelLook new fontSize: 10; foreground: Color gray); 
		addEventHandlerOn: BlClickEvent do: [ :anEvent | BlEvent fireEvent: anEvent target: self ];
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent. ];
		text:  'Target'
]
