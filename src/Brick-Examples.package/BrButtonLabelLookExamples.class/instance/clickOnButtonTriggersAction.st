example - events
clickOnButtonTriggersAction
	<gtExample>
	| aButton actionTriggeredCount |

	actionTriggeredCount := 0.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton viewModel action: [ actionTriggeredCount := actionTriggeredCount + 1 ].
	
	BlSpace simulateClickOn: aButton.
	
	self assert: actionTriggeredCount equals: 1.
	
	^ aButton