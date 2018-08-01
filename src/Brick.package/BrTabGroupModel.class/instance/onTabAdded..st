hooks
onTabAdded: aBrTabModel

	aBrTabModel when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent currentTarget ].
	aBrTabModel when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent currentTarget ].

	self notifyTabAdded: aBrTabModel.
	
	"if user adds a tab marked as selected we should force select it"
	aBrTabModel isSelected
		ifTrue: [ ^ self onTabSelected: aBrTabModel ].
	
	"the first added tab should be selected by default"
	self tabs size = 1
		ifTrue: [ aBrTabModel select ]