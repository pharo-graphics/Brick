example - button
buttonWithLookFirstThenModel
	<gtExample>
	| aButton aModel aLook modelLabel lookLabel aLabelElement |
	
	modelLabel := 'Hello world'.
	lookLabel := 'Hello cruel world'.
	
	aButton := self buttonElement.

	aModel := self buttonModel.
	aModel label: modelLabel.
	
	aLook := self buttonLabelLookWithConstraints.
	aLook text: lookLabel.
	
	aButton look: aLook.
	self assert: aLook text asString equals: lookLabel.

	aLabelElement := aButton children first.
	self assert: aLabelElement text asString equals: lookLabel.
	
	aButton viewModel: aModel.
	
	self assert: aLook text asString equals: modelLabel.
	self assert: aModel label asString equals: modelLabel.
	self assert: aLabelElement text asString equals: modelLabel.
	
	^ aButton