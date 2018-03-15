hooks
onTabsChanged: aCollectionOfTabs
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tabs changed event without being attached to a widget' ].

	self tabModels do: [ :aTabElement | self onTabRemoved: aTabElement ].
	aCollectionOfTabs do: [ :aBrTabModel | self onTabAdded: aBrTabModel ]