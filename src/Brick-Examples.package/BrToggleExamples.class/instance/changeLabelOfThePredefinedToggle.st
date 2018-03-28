examples - toggle
changeLabelOfThePredefinedToggle
	<gtExample>
	| aToggle aLabel |
	
	aToggle := self predefinedToggle.
	aLabel := 'Hello world'.
	
	aToggle label: aLabel.
	self assert: aToggle label equals: aLabel.

	^ aToggle