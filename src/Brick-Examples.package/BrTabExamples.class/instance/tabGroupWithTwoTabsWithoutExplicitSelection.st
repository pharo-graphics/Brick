examples - tab group model
tabGroupWithTwoTabsWithoutExplicitSelection
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.
	aTabGroup addTab: aTab.
	
	self assert: aTab isSelected not.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTabGroup tabs first.

	^ aTabGroup