examples - toggle
toggleActivatedPredefinedToggle
	<gtExample>
	| aToggle |
	
	aToggle := self activatePredefinedToggle.
	aToggle toggle.

	self assert: aToggle isActivated not.
	self assert: aToggle viewModel isActivated not.
	
	^ aToggle