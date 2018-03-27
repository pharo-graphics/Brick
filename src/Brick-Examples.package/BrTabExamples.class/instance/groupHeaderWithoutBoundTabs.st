examples - ui header
groupHeaderWithoutBoundTabs
	<gtExample>	
	| tab1 tab2 tab3 tabGroup headerElement headerLook tabsRequest tabsChanged |
	
	tabsRequest := nil.
	
	tab1 := BrTabModel new label: 'Tab 1'.
	tab2 := BrTabModel new label: 'Tab 2'; disable.
	tab3 := BrTabModel new label: 'Tab 3'.
	
	tabGroup := BrTabGroupModel with: { tab1 . tab2 . tab3 }.
	tabGroup when: BrTabsRequest do: [ :aTabsRequest | tabsRequest := aTabsRequest copy ].
	
	headerLook := self groupHeaderLook.
	headerLook when: BrTabsChangedEvent do: [ :aTabsChanged | tabsChanged := aTabsChanged copy ].
	
	headerElement := BlElement new
		look: headerLook;
		viewModel: tabGroup;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].

	self assert: tabsRequest isNotNil.
	self assert: tabsRequest source equals: headerLook.

	self assert: tabsChanged isNotNil.
	self assert: tabsChanged source equals: tabGroup.

	self assert: headerElement children asArray equals: { headerLook header }.
		
	^ headerElement