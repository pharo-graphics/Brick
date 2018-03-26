examples - ui
materialLabelledTab
	<gtExample>
	| tabModel tabLook tabElement |
	
	tabModel := BrTabModel new label: 'Tab 1'.
	tabLook := BrMaterialTabLabelledLook asLook.
	
	tabElement := BlElement new.
	tabElement viewModel: tabModel.
	tabElement look: tabLook.
	
	self assert: tabElement children asArray equals: { tabLook labelLook label }.
	self assert: tabElement children first text asString equals: tabModel label.

	^ tabElement