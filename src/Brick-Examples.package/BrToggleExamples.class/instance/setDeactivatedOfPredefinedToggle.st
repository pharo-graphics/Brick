examples - toggle
setDeactivatedOfPredefinedToggle
	<gtExample>
	| aToggle |
	
	aToggle := self activatePredefinedToggle.
	aToggle activated: false.

	self assert: aToggle isActivated not.
	self assert: aToggle viewModel isActivated not.
	
	^ aToggle