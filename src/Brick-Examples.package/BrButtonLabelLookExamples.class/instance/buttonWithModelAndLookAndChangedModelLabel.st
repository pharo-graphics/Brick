example - button
buttonWithModelAndLookAndChangedModelLabel
	<gtExample>
	| aButton newLabel |
	
	newLabel := self labelText, ' World'.
	
	aButton := self buttonWithModelAndLookWithoutConstraints.
	
	aButton viewModel label: newLabel.

	self assert: aButton look text asString equals: newLabel.
	self assert: aButton look label text asString equals: newLabel.

	^ aButton