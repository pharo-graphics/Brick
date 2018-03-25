example - button
buttonWithModelAndLookWithConstraints
	<gtExample>
	| aButton aContent aLabelLook |
	
	aButton := self buttonElement.
	aContent := self buttonContentElementWithFrameLayout.
	aLabelLook := self buttonLabelLookWithConstraints.
	
	aButton addChild: aContent as: #content.

	aButton viewModel: self buttonModel.
	aButton look: aLabelLook.
	
	self assert: aLabelLook label text asString equals: self labelText.
	
	self assert: aButton children asArray equals: { aContent }.
	self assert: aContent children asArray equals: { aLabelLook label }.

	^ aButton