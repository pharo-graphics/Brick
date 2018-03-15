instance creation
tabModel
	<gtExample>
	| aTabModel |
	
	aTabModel := BrTabModel new.
	self assert: aTabModel isSelected not.
	
	^ aTabModel