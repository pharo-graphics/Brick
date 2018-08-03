example - model
changeLabelOfButtonModelEvent
	<gtExample>
	| aButtonModel aButtonLabel aLabelChangedEvent |
	
	aButtonModel := self labelModel + self buttonModel.
	aButtonLabel := 'Hello glamorous world'.
	
	aLabelChangedEvent := nil.
	aButtonModel when: BrLabelChanged do: [ :anEvent | aLabelChangedEvent := anEvent copy ].
	
	aButtonModel text: aButtonLabel.
	
	self assert: aButtonModel text asString equals: aButtonLabel.
	
	self assert: aLabelChangedEvent isNotNil.
	self assert: aLabelChangedEvent source equals: aButtonModel.
	self assert: aLabelChangedEvent target equals: aButtonModel.
	self assert: aLabelChangedEvent currentTarget equals: aButtonModel.
	self assert: aLabelChangedEvent isConsumed not.
	self assert: aLabelChangedEvent traversedTargets size equals: 2.
	
	^ aLabelChangedEvent