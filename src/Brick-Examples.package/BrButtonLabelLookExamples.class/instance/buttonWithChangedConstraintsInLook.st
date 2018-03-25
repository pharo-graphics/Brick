example - button
buttonWithChangedConstraintsInLook
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