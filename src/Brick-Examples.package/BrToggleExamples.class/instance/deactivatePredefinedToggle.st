examples - toggle
deactivatePredefinedToggle
	<gtExample>
	| aToggle |
	
	aToggle := self activatePredefinedToggle.
	aToggle deactivate.

	self assert: aToggle isActivated not.
	self assert: aToggle viewModel isActivated not.
	
	^ aToggle