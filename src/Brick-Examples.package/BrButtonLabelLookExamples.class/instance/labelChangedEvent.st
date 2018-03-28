example - events
labelChangedEvent
	<gtExample>
	| aButton newLabel aLabelChangedEvent |

	aLabelChangedEvent := nil.
	newLabel := self labelText, ' World'.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton look when: BrLabelChanged do: [ :anEvent | aLabelChangedEvent := anEvent copy ].
	aButton viewModel label: newLabel.
	
	self assert: aButton viewModel label equals: newLabel.

	self assert: aLabelChangedEvent notNil.
	self assert: aLabelChangedEvent isConsumed not.
	self assert: aLabelChangedEvent target equals: aButton look.
	self assert: aLabelChangedEvent currentTarget equals: aButton look.
	self assert: aLabelChangedEvent source equals: aButton viewModel.
	self assert: aLabelChangedEvent text equals: newLabel.
	self assert: aLabelChangedEvent timestamp isNil.
	self assert: aLabelChangedEvent traversedTargets size equals: 6.

	^ aLabelChangedEvent