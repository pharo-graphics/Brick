example - button
buttonWithDirectlyEmbeddedLabel
	<gtExample>
	| aButton aLabelLook |
	
	aButton := self buttonElement.
	aLabelLook := self buttonLabelLookWithConstraints.

	aButton viewModel: self allModels.
	aButton look: aLabelLook.
	
	self assert: aLabelLook label text asString equals: self labelText.
	self assert: aButton children asArray equals: { aLabelLook label }.

	^ aButton