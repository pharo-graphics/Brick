examples - tab group model
tabGroupWithOneTab
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupModel.
	self assert: aTabGroup isEmpty.
	self assert: aTabGroup hasSelectedTab not.
	
	aTab := self tabModel.
	aTab label: 'Tab 1'.
	self assert: aTab isSelected not.

	aTabGroup addTab: aTab.
	
	self assert: aTab isSelected.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTab.

	^ aTabGroup