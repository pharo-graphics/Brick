examples - toggle
toggleDeactivatedPredefinedToggle
	<gtExample>
	| aToggle |
	
	aToggle := self deactivatePredefinedToggle.
	aToggle toggle.

	self assert: aToggle isActivated.
	self assert: aToggle viewModel isActivated.
	
	^ aToggle