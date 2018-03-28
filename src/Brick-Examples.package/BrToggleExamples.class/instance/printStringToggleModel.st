examples - print
printStringToggleModel
	<gtExample>
	| aToggleModel aToggleLabel aPrintString |
	
	aToggleModel := self toggleModel.
	aToggleLabel := 'Hello world'.

	aToggleModel label: aToggleLabel.
	aPrintString := aToggleModel printString.
	
	self assert: aPrintString equals: aToggleLabel.
	
	^ aPrintString