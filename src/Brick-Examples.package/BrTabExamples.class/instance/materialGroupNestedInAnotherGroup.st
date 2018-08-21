examples - ui
materialGroupNestedInAnotherGroup
	<gtExample>
	| tab1 tabGroup |
	tab1 := BrTabModel new
		add: (BrLabelModel text: 'Parent Tab 1');
		stencil: [ self materialGroup ].
	tabGroup := BrTabGroupModel with: { tab1 }.
	tabGroup tabs do: [ :aTab |
		BlElement new
			look: BrMaterialTabLabelledLook;
			viewModel: aTab ].
	^ BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup