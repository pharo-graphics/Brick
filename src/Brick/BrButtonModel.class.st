"
! Button model

Button - An element of a graphical user interface which a user can select to perform a particular action.
(https://en.oxforddictionaries.com/definition/button)

I know how to react on a typical user action such as click or touch event. My reaction is defined by an ==#action== which can be any valuable:  ${class:BlockClosure}$, ${class:Symbol}$ or any object that responds to ==#value==

I am not responsible for labels or icons since buttons not necessarily have them.

See ${class:BrButtonModelExamples}$ for examples
"
Class {
	#name : #BrButtonModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'action'
	],
	#category : #'Brick-Button - Model'
}

{ #category : #printing }
BrButtonModel class >> modelName [
	^ 'Button'
]

{ #category : #'api - widget' }
BrButtonModel >> action [
	<return: #BlockClosure or: #Symbol or: #Valuable>
	
	^ action
]

{ #category : #'api - widget' }
BrButtonModel >> action: aBlockOrSymbolOrValuable [
	"An action can be a block with two optional parameters:
	 - a UI element to which this button model is attached
	 - this button model
	[ :aButtonElement :aButtonModel :anEvent |  ].

	Button action must not be nil"

	self
		assert: [ aBlockOrSymbolOrValuable isNotNil ]
		description: [ 'Button action must not be nil' ].

	action := aBlockOrSymbolOrValuable
]

{ #category : #'mouse handlers' }
BrButtonModel >> clickEvent: anEvent [
	anEvent consumed: true.

	(self request: BrActivationRequest oneWay) isActivated
		ifTrue: [ self action glamourValueWithArgs: { self widget .  self . anEvent } ]
]

{ #category : #'gt-extension' }
BrButtonModel >> gtActionFor: aView [
	<gtView>
	
	self action isClosure
		ifFalse: [ ^ aView empty ].
		
	^ aView forward
		title: 'Action';
		priority: 1;
		object: [ self action ];
		view: #gtSourceCodeFor:
]

{ #category : #initialization }
BrButtonModel >> initialize [
	super initialize.

	action := [  ]
]

{ #category : #initialization }
BrButtonModel >> initializeListeners [
	self when: BlClickEvent do: [ :anEvent | self clickEvent: anEvent ]
]
