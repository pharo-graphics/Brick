examples - tab group model
tabGroupWithTwoTabsSelectedAfterAdding
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.

	aTabGroup addTab: aTab.
	
	"a tab selected after adding must become selected"
	aTab select.
	
	self assert: aTab isSelected.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTab.

	^ aTabGroup