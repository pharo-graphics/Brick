examples - click
clickOnActivatedPredefinedToggle
	<gtExample>
	| aToggleElement aToggleModel aToggleDeactivatedEvent |
	
	NonInteractiveTranscript stdout show: 'clickOnActivatedPredefinedToggle' asString; cr.
	
	aToggleElement := self activatePredefinedToggle.
	aToggleModel := aToggleElement viewModel.
	
	aToggleDeactivatedEvent := nil.
	aToggleElement when: BrToggleDeactivatedEvent do: [ :anEvent | aToggleDeactivatedEvent := anEvent copy ].
	
	BlSpace simulateClickOn: aToggleElement.
	
	NonInteractiveTranscript stdout show: aToggleDeactivatedEvent asString; cr.
	
	self assert: aToggleElement isActivated not.
	self assert: aToggleModel isActivated not.
	
	self assert: aToggleDeactivatedEvent isNotNil.
	self assert: aToggleDeactivatedEvent source equals: aToggleModel.
	self assert: aToggleDeactivatedEvent target equals: aToggleElement.
	self assert: aToggleDeactivatedEvent currentTarget equals: aToggleElement.
	self assert: aToggleDeactivatedEvent isConsumed not.
	
	NonInteractiveTranscript stdout show: aToggleDeactivatedEvent traversedTargets size asString; cr.
	
	self assert: aToggleDeactivatedEvent traversedTargets size equals: 8. "3 for root->toggle + 4 looks + 1 handled by toggle look"
	
	self assert: aToggleDeactivatedEvent toggle equals: aToggleModel.
	
	^ aToggleDeactivatedEvent