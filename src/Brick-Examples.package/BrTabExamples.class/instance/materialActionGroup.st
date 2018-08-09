examples - ui
materialActionGroup
	<gtExample>
	| tab1 tab2 tab3 tabGroup |

	tab1 := BrTabModel new
		label: 'Tab 1';
		stencil: [
				(BlElement new
					size: 200@200;
					background: (Color blue alpha: 0.5)).
 		];
		actionsStencil: [ 
		| aToolbar aToolbarItem |
				aToolbar := BrToolbar new.
				aToolbar look: BrToolbarLook horizontal.
				aToolbarItem := BrToolbarItem new.
				aToolbarItem stencil: [ BrButton new 
								look: BrMaterialToggleLabelledLook;
								label: 'Hello'; 
								action: [ self inform: 'Click on Hello' ] 
				].
				aToolbarItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
				aToolbar addItem: aToolbarItem.
				
								aToolbarItem := BrToolbarItem new.
				aToolbarItem stencil: [ BrButton new 
								look: BrMaterialToggleLabelledLook;
								label: 'Hello'; 
								action: [ self inform: 'Click on Hello' ] 
				].
				aToolbarItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
				aToolbar addItem: aToolbarItem.
				
		 ].

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