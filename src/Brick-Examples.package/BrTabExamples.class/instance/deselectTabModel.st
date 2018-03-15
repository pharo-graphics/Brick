examples - tab model
deselectTabModel
	<gtExample>
	| aTabModel selected deselected deselectedTab selectedHander deselectedHandler |
	
	selected := deselected := 0.
	deselectedTab := nil.
	
	aTabModel := self selectTabModel.
	aTabModel addEventHandler: (selectedHander := BlEventHandler on: BrTabSelectedEvent do: [ selected := selected + 1 ]).
	aTabModel addEventHandler: (deselectedHandler := BlEventHandler on: BrTabDeselectedEvent do: [ :anEvent |
		deselected := deselected + 1.
		deselectedTab := anEvent tab ]).
	
	aTabModel deselect.

	self assert: aTabModel isSelected not.
	self assert: selected equals: 0.
	self assert: deselected equals: 1.
	self assert: deselectedTab equals: aTabModel.
	
	aTabModel removeEventHandler: selectedHander.
	aTabModel removeEventHandler: deselectedHandler.

	^ aTabModel