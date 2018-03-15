hooks
onTabSelected: aBrTabModel
	self tabs
		select: [ :eachTabModel | eachTabModel ~~ aBrTabModel ]
		thenDo: #deselect.

	selectedTab := aBrTabModel