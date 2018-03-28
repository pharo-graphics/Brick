examples - toggle group
addDeactivatedToggleToEmptyGroup
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	aToggleModel := self toggleModel.
	aToggleModel label: 'Toggle 1'.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModel }.

	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel