example - button
buttonWithModelFirstThenLook
	<gtExample>
	| aButton aModel aLook modelLabel lookLabel |
	
	modelLabel := 'Hello world'.
	lookLabel := 'Hello cruel world'.
	
	aButton := self buttonElement.

	aModel := self buttonModel.
	aModel label: modelLabel.
	
	aLook := self buttonLabelLookWithConstraints.
	aLook text: lookLabel.
	
	aButton viewModel: aModel.
	aButton look: aLook.
	
	self assert: aLook text asString equals: modelLabel.
	self assert: aModel label asString equals: modelLabel.
	
	^ aButton