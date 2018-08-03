example - events
labelChangedEvent
	<gtExample>
	| aButton newLabel aLabelChangedEvent |

	aLabelChangedEvent := nil.
	newLabel := self labelText, ' World'.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton look when: BrLabelChanged do: [ :anEvent | aLabelChangedEvent := anEvent copy ].
	aButton viewModel widgetModels first text: newLabel.

	self assert: aButton viewModel widgetModels first text asString equals: newLabel.

	self assert: aLabelChangedEvent notNil.
	self assert: aLabelChangedEvent isConsumed not.
	self assert: aLabelChangedEvent target equals: aButton look.
	self assert: aLabelChangedEvent currentTarget equals: aButton look.
	self assert: aLabelChangedEvent source equals: aButton viewModel widgetModels first.
	self assert: aLabelChangedEvent text asString equals: newLabel.
	self assert: aLabelChangedEvent timestamp isNil.
	self flag: 'aLabelChangedEvent traversedTargets size is sometimes 6, sometimes 8'.
	"self assert: aLabelChangedEvent traversedTargets size equals: 6."
	self assert: ( #( 6 8 ) includes: aLabelChangedEvent traversedTargets size).

	^ aLabelChangedEvent