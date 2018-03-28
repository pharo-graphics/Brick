examples - events
toggleAddedEvent
	<gtExample>
	| aToggleGroupModel aToggleModel aToggleAddedEvent |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	aToggleModel := self toggleModel.
	
	aToggleAddedEvent := nil.
	aToggleGroupModel when: BrToggleAddedEvent do: [ :anEvent | aToggleAddedEvent := anEvent copy ].
	
	aToggleGroupModel addToggle: aToggleModel.
	
	self assert: aToggleAddedEvent isNotNil.
	self assert: aToggleAddedEvent source equals: aToggleGroupModel.
	self assert: aToggleAddedEvent target equals: aToggleGroupModel.
	self assert: aToggleAddedEvent currentTarget equals: aToggleGroupModel.
	self assert: aToggleAddedEvent traversedTargets size equals: 2.
	self assert: aToggleAddedEvent isConsumed not.

	self assert: aToggleAddedEvent toggle equals: aToggleModel.
	
	^ aToggleAddedEvent