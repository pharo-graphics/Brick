example - button
buttonWithOnlyModel
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