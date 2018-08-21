examples - tab group model
tabGroupWithTwoTabsSelectedBeforeAdding
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.
	"a tab selected before adding it to a group must remain selected"
	aTab select.

	aTabGroup addTab: aTab.
	
	self assert: aTab isSelected.

	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTab.

	^ aTabGroup