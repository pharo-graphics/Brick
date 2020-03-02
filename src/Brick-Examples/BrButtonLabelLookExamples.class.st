"
!! Playing with Label Looks for Buttons

When using a label look, the label look embeds the label element directly in the widget element as a child. In the example below, the look is added directly to the button element:
${example:name=BrButtonLabelLookExamples>>#buttonWithDirectlyEmbeddedLabel|expanded=true|expandedPreview=true}$

If the button has a more complex structure, this behaviour can cause problems. In the example below, the button defines a content element in which the label should be added. However, because the look is added to the button element, the label will be emdedd in the button element instead of the content element:
${example:name=BrButtonLabelLookExamples>>#buttonWithModelAndWrongContentPlacement|expanded=true|expandedPreview=true}$

To change this behavior, the label look  provides more control over where the label is inserted into the button element: to identify the element in the button element where the label should be placed, the look looks for an element marked with ==#content==. There shoud be only one element marked with  ==#content==.  To fix the problem from the above example,  we can mark the ==aContent== element with ==#content== when adding it to the button element:
${example:name=BrButtonLabelLookExamples>>#buttonWithModelAndLookWithoutConstraints|expanded=true|expandedPreview=true}$

The label look can directly change properties of the label element. This can be usefull when one wants to change layout properties or update graphical properties of the label:
${example:name=BrButtonLabelLookExamples>>#buttonWithChangedConstraintsInLook|expanded=true|expandedPreview=true}$

After linking the button element with the label look and the button model, changing the value in the button model updates the label in the button element:
${example:name=BrButtonLabelLookExamples>>#buttonWithModelAndLookAndChangedModelLabel|expanded=true|expandedPreview=true}$

When changing the label in the model, a ==BlLabelChanged== event is triggered that reaches the label look, through the button widget. The propagation of this element is as follows:
${example:name=BrButtonLabelLookExamples>>#labelChangedEvent|expanded=true|expandedPreview=true|show=gtTraversedLiveFor:}$

In case the button widget does not have a label look attached, changing the value of the text in the model does not update the visual representation of the label in the button widget:
${example:name=BrButtonLabelLookExamples>>#buttonWithOnlyModelAndChangedModelLabel|expanded=true|expandedPreview=true}$

When attaching a label look and a button model to a button widget the order in which they are attached does not matter.  If the model is set first then the text value set in the label look is not used; the model has priority  over the label look
${example:name=BrButtonLabelLookExamples>>#buttonWithModelFirstThenLook|expanded=true|expandedPreview=true}$

If the label look is set first, and the button widget does not have a model the the text value defined in the label look is used. If the button widget  is then assigned a button model, then the value defined in the model is used:
${example:name=BrButtonLabelLookExamples>>#buttonWithLookFirstThenModel|expanded=true|expandedPreview=true}$
"
Class {
	#name : #BrButtonLabelLookExamples,
	#superclass : #Object,
	#category : #'Brick-Examples'
}

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> allModels [
	<gtExample>
	
	| aModel |
	aModel := self buttonModel + self labelModel + self iconModel.
	self assert: aModel widgetModels size equals: 2.
	^ aModel
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonContentElementWithFrameLayout [
	<gtExample>

	^ BlElement new
		border: (BlBorder paint: Color black width: 1);
		background: (Color white alpha: 0.5);
		layout: BlFrameLayout new;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent.
			c padding: (BlInsets all: 10) ]
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonContentElementWithLinearLayout [
	<gtExample>

	^ BlElement new
		border: (BlBorder paint: Color black width: 1);
		background: (Color white alpha: 0.5);
		layout: BlLinearLayout new alignCenter;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent.
			c padding: (BlInsets all: 10) ]
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonElement [
	<gtExample>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ];
		background: (Color gray alpha: 0.3);
		padding: (BlInsets all: 10)
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonLabelElement [
	<gtExample>
	
	^ (BlTextElement text: self labelText asRopedText)
		constraintsDo: [ :c |
			c frame vertical alignCenter.
			c frame horizontal alignCenter ]
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonLabelLookWithConstraints [
	<gtExample>

	^ BrTextLabelLook new labelDo: [ :aLabelElement | 
		aLabelElement constraintsDo: [ :c |
			c frame vertical alignCenter.
			c frame horizontal alignCenter ] ]
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonLabelLookWithoutConstraints [
	<gtExample>

	^ BrTextLabelLook asLook
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> buttonModel [
	<gtExample>
	
	^ BrButtonModel new action: [ self inform: 'Clicked!' ]
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithChangedConstraintsInLook [
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithLinearLayout.
	aLabelLook := self buttonLabelLookWithoutConstraints
		labelDo: [ :aLabelElement | aLabelElement constraintsDo: [ :c | c linear vertical alignBottom ] ];
		fontSize: 30;
		bold.
	
	aButton addChild: aContent as: #content.

	aButton viewModel: self buttonModel.
	aButton look: aLabelLook.
	
	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithDirectlyEmbeddedLabel [
	<gtExample>
	| aButton aLabelLook |
	
	aButton := self buttonElement.
	aLabelLook := self buttonLabelLookWithConstraints.

	aButton viewModel: self allModels.
	aButton look: aLabelLook.
	
	self assert: aLabelLook label text asString equals: self labelText.
	self assert: aButton children asArray equals: { aLabelLook label }.

	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithLookFirstThenModel [
	<gtExample>
	| aButton aModel aLook modelLabel lookLabel aLabelElement |
	
	modelLabel := 'Hello world'.
	lookLabel := 'Hello glamorous world'.
	
	aButton := self buttonElement.

	aModel := self labelModel + self buttonModel.
	aModel text: modelLabel.
	
	aLook := self buttonLabelLookWithConstraints.
	aLook text: lookLabel.
	
	aButton look: aLook.
	self assert: aLook text asString equals: lookLabel.

	aLabelElement := aButton children first.
	self assert: aLabelElement text asString equals: lookLabel.
	
	aButton viewModel: aModel.
	
	self assert: aLook text asString equals: modelLabel.
	self assert: aModel text asString equals: modelLabel.
	self assert: aLabelElement text asString equals: modelLabel.
	
	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithModelAndLookAndChangedModelLabel [
	<gtExample>
	| aButton newLabel |
	
	newLabel := self labelText, ' World'.
	
	aButton := self buttonWithModelAndLookWithoutConstraints.
	
	aButton viewModel widgetModels first text: newLabel.

	self assert: aButton look text asString equals: newLabel.
	self assert: aButton look label text asString equals: newLabel.

	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithModelAndLookWithConstraints [
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithFrameLayout.
	aLabelLook := self buttonLabelLookWithConstraints.
	
	aButton addChild: aContent as: #content.

	aButton viewModel: self allModels.
	aButton look: aLabelLook.
	
	self assert: aLabelLook label text asString equals: self labelText.
	
	self assert: aButton children asArray equals: { aContent }.
	self assert: aContent children asArray equals: { aLabelLook label }.

	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithModelAndLookWithoutConstraints [
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithLinearLayout.
	aLabelLook := self buttonLabelLookWithoutConstraints.
	
	aButton addChild: aContent as: #content.

	aButton look: aLabelLook.
	aButton viewModel: self allModels.
	
	self assert: aLabelLook label text asString equals: self labelText.

	self assert: aButton children asArray equals: { aContent }.
	self assert: aContent children asArray equals: { aLabelLook label }.

	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithModelAndWrongContentPlacement [
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithFrameLayout.
	aLabelLook := self buttonLabelLookWithConstraints.

	aButton addChild: aContent.

	aButton viewModel: self allModels.
	aButton look: aLabelLook.

	self assert: aButton children asArray equals: { aContent . aLabelLook label }.
	self assert: aContent children asArray equals: { }.

	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithModelFirstThenLook [
	<gtExample>
	| aButton aModel aLook modelLabel lookLabel |
	
	modelLabel := 'Hello world'.
	lookLabel := 'Hello cruel world'.
	
	aButton := self buttonElement.

	aModel := self labelModel + self buttonModel.
	aModel text: modelLabel.
	
	aLook := self buttonLabelLookWithConstraints.
	aLook text: lookLabel.
	
	aButton viewModel: aModel.
	aButton look: aLook.
	
	self assert: aLook text asString equals: modelLabel.
	self assert: aModel text asString equals: modelLabel.
	
	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithOnlyModel [
	<gtExample>
	| aButton aContent aLabel |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithFrameLayout.
	aLabel := self buttonLabelElement.

	aContent addChild: aLabel.
	aButton addChild: aContent.

	aButton viewModel: self labelModel + self buttonModel.

	self assert: aLabel text asString equals: self labelText.

	self assert: aButton children asArray equals: { aContent }.
	self assert: aContent children asArray equals: { aLabel }.

	^ aButton
]

{ #category : #'example - button' }
BrButtonLabelLookExamples >> buttonWithOnlyModelAndChangedModelLabel [
	<gtExample>
	| aButton aLabel |
	
	aButton := self buttonWithOnlyModel.
	
	"we know the structure from the sub-example"
	aLabel := aButton children first children first.
	
	"changing label in the view model does not propagate to the label element"
	self flag: 'Do we need the following line?'.
	self labelModel text: self labelText, ' world'.
	self assert: aLabel text asString equals: self labelText.

	^ aButton
]

{ #category : #'example - model' }
BrButtonLabelLookExamples >> changeIconOfButtonModelEvent [
	<gtExample>
	| anIconModel aButtonIcon anIconChangedEvent |

	anIconModel := self iconModel.
	aButtonIcon := ((BlEllipse new) extent: 10@10) asElement.
	
	anIconChangedEvent := nil.
	anIconModel when: BrIconChanged do: [ :anEvent | anIconChangedEvent := anEvent copy ].
	
	anIconModel icon: aButtonIcon.
	
	self assert: anIconModel icon equals: aButtonIcon.
	
	self assert: anIconChangedEvent isNotNil.
	self assert: anIconChangedEvent source equals: anIconModel.
	self assert: anIconChangedEvent target equals: anIconModel.
	self assert: anIconChangedEvent currentTarget equals: anIconModel.
	self assert: anIconChangedEvent isConsumed not.
	
	^ anIconChangedEvent
]

{ #category : #'example - model' }
BrButtonLabelLookExamples >> changeLabelOfButtonModelEvent [
	<gtExample>
	| aButtonModel aButtonLabel aLabelChangedEvent |
	
	aButtonModel := self labelModel + self buttonModel.
	aButtonLabel := 'Hello glamorous world'.
	
	aLabelChangedEvent := nil.
	aButtonModel when: BrLabelChanged do: [ :anEvent | aLabelChangedEvent := anEvent copy ].
	
	aButtonModel text: aButtonLabel.
	
	self assert: aButtonModel text asString equals: aButtonLabel.
	
	self assert: aLabelChangedEvent isNotNil.
	self assert: aLabelChangedEvent source equals: aButtonModel.
	self assert: aLabelChangedEvent target equals: aButtonModel.
	self assert: aLabelChangedEvent currentTarget equals: aButtonModel.
	self assert: aLabelChangedEvent isConsumed not.
	
	^ aLabelChangedEvent
]

{ #category : #'example - events' }
BrButtonLabelLookExamples >> clickOnButtonTriggersAction [
	<gtExample>
	| aButton actionTriggeredCount |

	actionTriggeredCount := 0.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton viewModel action: [ actionTriggeredCount := actionTriggeredCount + 1 ].
	
	BlSpace simulateClickOn: aButton.
	
	self assert: actionTriggeredCount equals: 1.
	
	^ aButton
]

{ #category : #'example - events' }
BrButtonLabelLookExamples >> iconChangedEvent [
	<gtExample>
	| aButton newIcon anIconChangedEvent |

	anIconChangedEvent := nil.
	newIcon := ((BlEllipse new) extent: 10@10) asElement.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton look when: BrIconChanged do: [ :anEvent | anIconChangedEvent := anEvent copy ].
	aButton viewModel widgetModels second icon: newIcon.
	
	self assert: aButton viewModel widgetModels second icon equals: newIcon.

	self assert: anIconChangedEvent notNil.
	self assert: anIconChangedEvent isConsumed not.
	self assert: anIconChangedEvent target equals: aButton look.
	self assert: anIconChangedEvent currentTarget equals: aButton look.
	self assert: anIconChangedEvent source equals: aButton viewModel widgetModels second.
	self assert: anIconChangedEvent icon equals: newIcon.
	self assert: anIconChangedEvent timestamp isNil.	

	^ anIconChangedEvent
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> iconModel [
	<gtExample>
	
	^ BrIconModel new
]

{ #category : #'example - events' }
BrButtonLabelLookExamples >> labelChangedEvent [
	<gtExample>
	| aButton newLabel aLabelChangedEvent |

	aLabelChangedEvent := nil.
	newLabel := self labelText, ' World'.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton look when: BrLabelChanged do: [ :anEvent | aLabelChangedEvent := anEvent copy ].
	aButton viewModel widgetModels first text: newLabel.

	self assert: aButton viewModel widgetModels first text asString equals: newLabel.

	self assert: aLabelChangedEvent notNil.
	self assert: aLabelChangedEvent isConsumed not.
	self assert: aLabelChangedEvent target equals: aButton look.
	self assert: aLabelChangedEvent currentTarget equals: aButton look.
	self assert: aLabelChangedEvent source equals: aButton viewModel widgetModels first.
	self assert: aLabelChangedEvent text asString equals: newLabel.
	self assert: aLabelChangedEvent timestamp isNil.

	^ aLabelChangedEvent
]

{ #category : #'example - instance creation' }
BrButtonLabelLookExamples >> labelModel [
	<gtExample>
	
	^ BrLabelModel new text: self labelText
]

{ #category : #accessing }
BrButtonLabelLookExamples >> labelText [
	
	^ 'Hello'
]
