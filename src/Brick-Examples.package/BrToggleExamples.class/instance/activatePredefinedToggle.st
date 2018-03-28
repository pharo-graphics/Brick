examples - toggle
activatePredefinedToggle
	<gtExample>
	| aToggle |
	
	aToggle := self predefinedToggle.
	aToggle activate.

	self assert: aToggle isActivated.
	self assert: aToggle viewModel isActivated.
	
	^ aToggle