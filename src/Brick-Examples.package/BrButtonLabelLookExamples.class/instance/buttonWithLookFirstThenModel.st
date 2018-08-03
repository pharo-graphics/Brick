example - button
buttonWithLookFirstThenModel
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