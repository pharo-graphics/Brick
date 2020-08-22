Class {
	#name : #BrEnablementExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Activation'
}

{ #category : #'examples - instance creation' }
BrEnablementExamples >> buttonModel [
	<gtExample>
	
	^ BrButtonModel new
]

{ #category : #'examples - enablement buttons' }
BrEnablementExamples >> buttonModelWithoutEnablement [
	<gtExample>
	| aButton aResponse |

	aButton := self buttonModel.

	aResponse := aButton request: BrEnablementRequest oneWay.
	self assert: aResponse enabled.
	self assert: aResponse isActivated.

	^ aButton
]

{ #category : #'instance creation' }
BrEnablementExamples >> childWithEnablementLook [
	<gtExample>

	^ BlElement new
		size: 100@70;
		look: (BrInteractiveCommonLook new
			default: [ :aWidget |
				aWidget
					background: ((Color r: 0.199 g: 0.8 b: 1.0 alpha: 1.0) alpha: 0.2);
					border: (BlBorder paint: (Color r: 0.199 g: 0.8 b: 1.0 alpha: 1.0) width: 1) ];
			disabled: [ :aWidget |
				aWidget
					background: (Color gray alpha: 0.1);
					border: (BlBorder builder dashed paint: (Color gray alpha: 0.5); width: 1; build) ])
]

{ #category : #'examples - enable / disable' }
BrEnablementExamples >> disabledModel [
	<gtExample>
	| aModel anActivationEventHandler activationCounter isActivatedInEvent |

	aModel := self enablementModel.
	
	activationCounter := 0.
	isActivatedInEvent := nil.
	anActivationEventHandler := BlEventHandler on: BrEnablementChanged do: [ :anEvent |
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
BrEnablementExamples >> elementsForEnablementPropagation [
	<gtExample>
	| parent child aResponse |

	parent := self parentWithEnablementLook.
	child := self childWithEnablementLook.
	child relocate: 50@50.

	parent addChild: child.

	"by default widgets are enabled, even if the model is absent"
	aResponse := child look request: BrEnablementRequest oneWay.
	self assert: aResponse enabled.
	self assert: aResponse isEnabled.
	
	aResponse := parent look request: BrEnablementRequest oneWay.
	self assert: aResponse enabled.
	self assert: aResponse isEnabled.

	^ parent
]

{ #category : #'examples - enable / disable' }
BrEnablementExamples >> enabledModel [
	<gtExample>
	| aModel anEnablementEventHandler enablementCounter isEnabledInEvent |

	aModel := self disabledModel.

	enablementCounter := 0.
	isEnabledInEvent := nil.
	anEnablementEventHandler := BlEventHandler on: BrEnablementChanged do: [ :anEvent |
		enablementCounter := enablementCounter + 1.
		isEnabledInEvent := anEvent enabled ].
	aModel addEventHandler: anEnablementEventHandler.
	
	aModel enable.
	
	aModel removeEventHandler: anEnablementEventHandler.
	
	self assert: aModel isEnabled.
	self assert: aModel isDisabled not.
	self assert: enablementCounter equals: 1.
	self assert: isEnabledInEvent.
	
	^ aModel
]

{ #category : #'examples - instance creation' }
BrEnablementExamples >> enablementModel [
	<gtExample>
	| aModel |
	
	aModel := BrEnablementModel new.
	self assert: aModel isEnabled.
	self assert: aModel isDisabled not.
	self assert: aModel widgetModels isEmpty.
	
	^ aModel
]

{ #category : #'instance creation' }
BrEnablementExamples >> parentWithEnablementLook [
	<gtExample>
	
	^ BlElement new
		size: 300@200;
		look: (BrInteractiveCommonLook new
			default: [ :aWidget |
				aWidget
					background: (Color gray alpha: 0.2);
					border: (BlBorder paint: Color gray width: 1) ];
			disabled: [ :aWidget |
				aWidget
					background: (Color gray alpha: 0.1);
					border: (BlBorder builder dashed paint: (Color gray alpha: 0.5); width: 1; build) ])
]
