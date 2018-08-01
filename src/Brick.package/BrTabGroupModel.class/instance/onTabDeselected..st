hooks
onTabDeselected: aBrTabModel
	selectedTab == aBrTabModel
		ifTrue: [
			selectedTab := nil.
			self dispatchEvent: (BrTabDeselectedEvent tab: aBrTabModel) ]