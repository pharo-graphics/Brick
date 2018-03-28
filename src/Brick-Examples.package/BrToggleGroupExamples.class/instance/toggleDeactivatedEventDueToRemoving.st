examples - events
toggleDeactivatedEventDueToRemoving
	<gtExample>
	| aToggleGroupModel aToggleModel aToggleDeactivatedEvent |
	
	aToggleGroupModel := self addActivatedToggleToEmptyGroup.
	aToggleModel := aToggleGroupModel toggles first.
	
	aToggleDeactivatedEvent := nil.
	aToggleModel when: BrToggleDeactivatedEvent do: [ :anEvent | aToggleDeactivatedEvent := anEvent copy ].
	
	aToggleGroupModel removeToggle: aToggleModel.
	
	self assert: aToggleDeactivatedEvent isNotNil.
	self assert: aToggleDeactivatedEvent source equals: aToggleModel.
	self assert: aToggleDeactivatedEvent target equals: aToggleModel.
	self assert: aToggleDeactivatedEvent currentTarget equals: aToggleModel.
	self assert: aToggleDeactivatedEvent traversedTargets size equals: 2.
	self assert: aToggleDeactivatedEvent isConsumed not.

	self assert: aToggleDeactivatedEvent toggle equals: aToggleModel.
	
	^ aToggleDeactivatedEvent