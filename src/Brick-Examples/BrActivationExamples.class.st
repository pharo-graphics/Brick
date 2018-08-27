Class {
	#name : #BrActivationExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Activation'
}

{ #category : #'examples - instance creation' }
BrActivationExamples >> activationModel [
	<gtExample>
	| aModel |
	
	aModel := BrActivationModel new.
	self assert: aModel isEnabled.
	self assert: aModel isDisabled not.
	self assert: aModel widgetModels isEmpty.
	
	^ aModel
]

{ #category : #'examples - instance creation' }
BrActivationExamples >> buttonModel [
	<gtExample>
	
	^ BrButtonModel new
]

{ #category : #'example - activatable buttons' }
BrActivationExamples >> buttonModelWithDisabledActivation [
	<gtExample>
	| aButton aResponse |
	
	aButton := self buttonModel.
	aButton add: self disableModel.

	aResponse := aButton request: BrActivationRequest new.
	self assert: aResponse enabled not.
	self assert: aResponse isActivated not.

	^ aButton
]

{ #category : #'example - activatable buttons' }
BrActivationExamples >> buttonModelWithEnabledActivation [
	<gtExample>
	| aButton aResponse |

	aButton := self buttonModel.
	aButton add: self enableModel.

	aResponse := aButton request: BrActivationRequest new.
	self assert: aResponse enabled.
	self assert: aResponse isActivated.

	^ aButton
]

{ #category : #'example - activatable buttons' }
BrActivationExamples >> buttonModelWithoutActivation [
	<gtExample>
	| aButton aResponse |

	aButton := self buttonModel.

	aResponse := aButton request: BrActivationRequest new.
	self assert: aResponse enabled.
	self assert: aResponse isActivated.

	^ aButton
]

{ #category : #'examples - enable / disable' }
BrActivationExamples >> disableModel [
	<gtExample>
	| aModel anActivationEventHandler activationCounter isActivatedInEvent |

	aModel := self activationModel.
	
	activationCounter := 0.
	isActivatedInEvent := nil.
	anActivationEventHandler := BlEventHandler on: BrActivationChanged do: [ :anEvent |
		activationCounter := activationCounter + 1.
		isActivatedInEvent := anEvent enabled ].
	aModel addEventHandler: anActivationEventHandler.

	aModel disable.

	aModel removeEventHandler: anActivationEventHandler.

	self assert: aModel isEnabled not.
	self assert: aModel isDisabled.
	self assert: activationCounter equals: 1.
	self assert: isActivatedInEvent not.

	^ aModel
]

{ #category : #'examples - enable / disable' }
BrActivationExamples >> enableModel [
	<gtExample>
	| aModel anActivationEventHandler activationCounter isActivatedInEvent |
	
	aModel := self disableModel.

	activationCounter := 0.
	isActivatedInEvent := nil.
	anActivationEventHandler := BlEventHandler on: BrActivationChanged do: [ :anEvent |
		activationCounter := activationCounter + 1.
		isActivatedInEvent := anEvent enabled ].
	aModel addEventHandler: anActivationEventHandler.
	
	aModel enable.
	
	aModel removeEventHandler: anActivationEventHandler.
	
	self assert: aModel isEnabled.
	self assert: aModel isDisabled not.
	self assert: activationCounter equals: 1.
	self assert: isActivatedInEvent.
	
	^ aModel
]
