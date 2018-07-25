examples - model
clickOnElementWithButtonModel
	<gtExample>
	| anElement |

	anElement := self elementWithButtonModel.
	BlSpace simulateClickOn: anElement.

	self assert: anElement viewModel model equals: #clicked.

	^ anElement