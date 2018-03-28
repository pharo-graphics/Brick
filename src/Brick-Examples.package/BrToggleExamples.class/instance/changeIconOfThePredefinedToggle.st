examples - toggle
changeIconOfThePredefinedToggle
	<gtExample>
	| aToggle anIcon |
	
	aToggle := self predefinedToggle.
	anIcon := (BlEllipse extent: 10@10) asElement.
	
	aToggle icon: anIcon.
	self assert: aToggle icon equals: anIcon.

	^ aToggle