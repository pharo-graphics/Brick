examples - toggle
setActivatedOfPredefinedToggle
	<gtExample>
	| aToggle |
	
	aToggle := self predefinedToggle.
	aToggle activated: true.

	self assert: aToggle isActivated.
	self assert: aToggle viewModel isActivated.
	
	^ aToggle