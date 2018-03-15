api - tabs
selectedTab
	<return: #BrTabModel>
	
	self
		assert: [ self hasSelectedTab ]
		description: [ 'Can not access a selected tab if there is no one' ].
		
	^ selectedTab