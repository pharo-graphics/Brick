examples - ui
materialGroup
	<gtExample>
	| tab1 tab2 tab3 tabGroup |

	tab1 := BrTabModel new
		label: 'Tab 1';
		stencil: [ BlElement new
			size: 200@200;
			background: (Color red alpha: 0.5) ].

	tab2 := BrTabModel new label: 'Tab 2'; disable.

	tab3 := BrTabModel new
		label: 'Tab 3';
		stencil: [ BlElement new
			size: 200@200;
			background: (Color blue alpha: 0.5) ].

	tabGroup := BrTabGroupModel with: { tab1 . tab2. tab3 }.

	tabGroup tabs do: [ :aTab |
		BlElement new
			look: BrMaterialTabLabelledLook;
			viewModel: aTab ].

	^ BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup