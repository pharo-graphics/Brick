examples - ui
materialLabelledTab
	<gtExample>
	| tabModel tabLook tabElement labelModel |
	
	tabModel := BrTabModel new add: (labelModel := BrLabelModel text: 'Tab 1').
	tabLook := BrMaterialTabLabelledLook asLook.

	tabElement := BlElement new.
	tabElement viewModel: tabModel.
	tabElement look: tabLook.

	self assert: tabElement children asArray equals: { tabLook labelLook label }.
	self assert: tabElement children first text asString equals: labelModel text asString.

	^ tabElement