examples - click
clickOnActivatedPredefinedToggle
	<gtExample>
	| aToggleElement aToggleModel aToggleDeactivatedEvent |
		
	aToggleElement := self activatePredefinedToggle.
	aToggleModel := aToggleElement viewModel.
	
	aToggleDeactivatedEvent := nil.
	aToggleElement when: BrToggleDeactivatedEvent do: [ :anEvent | aToggleDeactivatedEvent := anEvent copy ].
	
	BlSpace simulateClickOn: aToggleElement.
	
	self assert: aToggleElement isActivated not.
	self assert: aToggleModel isActivated not.
	
	self assert: aToggleDeactivatedEvent isNotNil.
	self assert: aToggleDeactivatedEvent source equals: aToggleModel.
	self assert: aToggleDeactivatedEvent target equals: aToggleElement.
	self assert: aToggleDeactivatedEvent currentTarget equals: aToggleElement.
	self assert: aToggleDeactivatedEvent isConsumed not.
	
	self assert: aToggleDeactivatedEvent toggle equals: aToggleModel.
	
	^ aToggleDeactivatedEvent