example - button
buttonWithOnlyModelAndChangedModelLabel
	<gtExample>
	| aButton aLabel |
	
	aButton := self buttonWithOnlyModel.
	
	"we know the structure from the sub-example"
	aLabel := aButton children first children first.
	
	"changing label in the view model does not propagate to the label element"
	self buttonModel label: self labelText, ' world'.
	self assert: aLabel text asString equals: self labelText.

	^ aButton