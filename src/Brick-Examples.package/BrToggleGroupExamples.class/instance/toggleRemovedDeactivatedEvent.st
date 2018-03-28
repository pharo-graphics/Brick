examples - events
toggleRemovedDeactivatedEvent
	<gtExample>
	| aToggleGroupModel aToggleModel aToggleRemovedEvent |
	
	aToggleGroupModel := self addDeactivatedToggleToEmptyGroup.
	aToggleModel := aToggleGroupModel toggles first.
	
	aToggleRemovedEvent := nil.
	aToggleGroupModel when: BrToggleRemovedEvent do: [ :anEvent | aToggleRemovedEvent := anEvent copy ].
	
	aToggleGroupModel removeToggle: aToggleModel.
	
	self assert: aToggleRemovedEvent isNotNil.
	self assert: aToggleRemovedEvent source equals: aToggleGroupModel.
	self assert: aToggleRemovedEvent target equals: aToggleGroupModel.
	self assert: aToggleRemovedEvent currentTarget equals: aToggleGroupModel.
	self assert: aToggleRemovedEvent traversedTargets size equals: 2.
	self assert: aToggleRemovedEvent isConsumed not.

	self assert: aToggleRemovedEvent toggle equals: aToggleModel.
	
	^ aToggleRemovedEvent