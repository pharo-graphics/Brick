examples - tab model
selectTabModel
	<gtExample>
	| aTabModel selected selectedTab deselected selectedHander deselectedHandler |
	
	selected := deselected := 0.
	selectedTab := nil.
	
	aTabModel := self tabModel.
	aTabModel addEventHandler: (selectedHander := BlEventHandler on: BrTabSelectedEvent do: [ :anEvent |
		selected := selected + 1.
		selectedTab := anEvent tab ]).
	aTabModel addEventHandler: (deselectedHandler := BlEventHandler on: BrTabDeselectedEvent do: [	deselected := deselected + 1 ]).
	
	aTabModel select.
	
	self assert: aTabModel isSelected.
	self assert: selected equals: 1.
	self assert: deselected equals: 0.
	self assert: selectedTab equals: aTabModel.

	aTabModel removeEventHandler: selectedHander.
	aTabModel removeEventHandler: deselectedHandler.

	^ aTabModel