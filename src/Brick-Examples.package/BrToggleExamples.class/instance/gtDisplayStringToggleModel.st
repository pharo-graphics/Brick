examples - print
gtDisplayStringToggleModel
	<gtExample>
	| aToggleModel aToggleLabel aPrintString |
	
	aToggleModel := self toggleModel.
	aToggleLabel := 'Hello world'.

	aToggleModel label: aToggleLabel.
	aPrintString := aToggleModel gtDisplayString.
	
	self assert: aPrintString equals: aToggleLabel.
	
	^ aPrintString