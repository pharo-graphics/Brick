examples - click
clickOnDeactivatedPredefinedToggle
	<gtExample>
	| aToggleElement aToggleModel aToggleActivatedEvent |
	
	aToggleElement := self deactivatePredefinedToggle.
	aToggleModel := aToggleElement viewModel.
	
	aToggleActivatedEvent := nil.
	aToggleElement when: BrToggleActivatedEvent do: [ :anEvent | aToggleActivatedEvent := anEvent copy ].
	
	BlSpace simulateClickOn: aToggleElement.
	
	self assert: aToggleElement isActivated.
	self assert: aToggleModel isActivated.
	
	self assert: aToggleActivatedEvent isNotNil.
	self assert: aToggleActivatedEvent source equals: aToggleModel.
	self assert: aToggleActivatedEvent target equals: aToggleElement.
	self assert: aToggleActivatedEvent currentTarget equals: aToggleElement.
	self assert: aToggleActivatedEvent isConsumed not.
	self assert: aToggleActivatedEvent traversedTargets size equals: 6 "3 for root->toggle + 3 looks".
	
	self assert: aToggleActivatedEvent toggle equals: aToggleModel.
	
	^ aToggleActivatedEvent