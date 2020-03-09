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

{ #category : #'examples - activatable buttons' }
BrActivationExamples >> buttonModelWithoutActivation [
	<gtExample>
	| aButton aResponse |

	aButton := self buttonModel.

	aResponse := aButton request: BrActivationRequest oneWay.
	self assert: aResponse enabled.
	self assert: aResponse isActivated.

	^ aButton
]

{ #category : #'instance creation' }
BrActivationExamples >> childWithActivationLook [
	<gtExample>
	
	^ BlElement new
		size: 100@70;
		look: (BrInteractiveLook new style: [ :aStyler |
			aStyler default: [ :aWidget |
				aWidget
					background: ((Color r: 0.199 g: 0.8 b: 1.0 alpha: 1.0) alpha: 0.2);
					border: (BlBorder paint: (Color r: 0.199 g: 0.8 b: 1.0 alpha: 1.0) width: 1) ].
			aStyler disabled: [ :aWidget |
				aWidget
					background: (Color gray alpha: 0.1);
					border: (BlBorder builder dashed paint: (Color gray alpha: 0.5); width: 1; build) ] ])
]

{ #category : #'examples - enable / disable' }
BrActivationExamples >> disabledModel [
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

{ #category : #'examples - propagation' }
BrActivationExamples >> elementsForActivationPropagation [
	<gtExample>
	| parent child aResponse |

	parent := self parentWithActivationLook.
	child := self childWithActivationLook.
	child relocate: 50@50.

	parent addChild: child.

	"by default widgets are activated, even if the model is absent"
	aResponse := child look request: BrActivationRequest oneWay.
	self assert: aResponse enabled.
	self assert: aResponse isActivated.
	
	aResponse := parent look request: BrActivationRequest oneWay.
	self assert: aResponse enabled.
	self assert: aResponse isActivated.

	^ parent
]

{ #category : #'examples - enable / disable' }
BrActivationExamples >> enabledModel [
	<gtExample>
	| aModel anActivationEventHandler activationCounter isActivatedInEvent |

	aModel := self disabledModel.

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

{ #category : #'instance creation' }
BrActivationExamples >> parentWithActivationLook [
	<gtExample>
	
	^ BlElement new
		size: 300@200;
		look: (BrInteractiveLook new style: [ :aStyler |
			aStyler default: [ :aWidget |
				aWidget
					background: (Color gray alpha: 0.2);
					border: (BlBorder paint: Color gray width: 1) ].
			aStyler disabled: [ :aWidget |
				aWidget
					background: (Color gray alpha: 0.1);
					border: (BlBorder builder dashed paint: (Color gray alpha: 0.5); width: 1; build) ] ])
]
