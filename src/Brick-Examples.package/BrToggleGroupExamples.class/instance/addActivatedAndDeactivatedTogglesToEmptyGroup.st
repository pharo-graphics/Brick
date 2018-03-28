examples - model
addActivatedAndDeactivatedTogglesToEmptyGroup
	<gtExample>
	| aToggleGroupModel aToggleModelActivated aToggleModelDeactivated |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	
	aToggleModelActivated := self toggleModel.
	aToggleModelActivated activate.
	aToggleModelActivated label: 'Toggle 1'.
	
	aToggleModelDeactivated := self toggleModel.
	aToggleModelDeactivated label: 'Toggle 2'.
	
	aToggleGroupModel addToggles: { aToggleModelActivated . aToggleModelDeactivated }.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModelActivated.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModelActivated . aToggleModelDeactivated }.
	
	self assert: aToggleModelActivated isOneWay.
	self assert: aToggleModelDeactivated isOneWay.
	
	^ aToggleGroupModel