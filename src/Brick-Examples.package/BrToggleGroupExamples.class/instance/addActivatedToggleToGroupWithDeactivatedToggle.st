examples - toggle group
addActivatedToggleToGroupWithDeactivatedToggle
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self addDeactivatedToggleToEmptyGroup.
	aToggleModel := self toggleModel.
	aToggleModel activate.
	aToggleModel label: 'Toggle 2'.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModel.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleGroupModel toggles first .  aToggleModel }.
	
	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel