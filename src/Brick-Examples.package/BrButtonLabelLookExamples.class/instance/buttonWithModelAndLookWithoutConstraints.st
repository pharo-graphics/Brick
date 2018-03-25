example - button
buttonWithModelAndLookWithoutConstraints
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithLinearLayout.
	aLabelLook := self buttonLabelLookWithoutConstraints.
	
	aButton addChild: aContent as: #content.

	aButton viewModel: self buttonModel.
	aButton look: aLabelLook.
	
	self assert: aLabelLook label text asString equals: self labelText.

	self assert: aButton children asArray equals: { aContent }.
	self assert: aContent children asArray equals: { aLabelLook label }.

	^ aButton