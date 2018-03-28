examples - toggle group
addActivatedToggleToEmptyGroup
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	aToggleModel := self toggleModel.
	aToggleModel activate.
	aToggleModel label: 'Toggle 1'.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModel.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModel }.
	
	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel