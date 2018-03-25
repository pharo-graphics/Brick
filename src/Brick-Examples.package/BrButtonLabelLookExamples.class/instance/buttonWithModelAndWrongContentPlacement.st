example - button
buttonWithModelAndWrongContentPlacement
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithFrameLayout.
	aLabelLook := self buttonLabelLookWithConstraints.

	aButton addChild: aContent.

	aButton viewModel: self buttonModel.
	aButton look: aLabelLook.

	self assert: aButton children asArray equals: { aContent . aLabelLook label }.
	self assert: aContent children asArray equals: { }.

	^ aButton