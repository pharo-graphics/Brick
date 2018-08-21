examples - ui
materialActionGroup
	<gtExample>
	| tab1 tab2 tab3 tabGroup tabGroupElement |

	tab1 := BrTabModel new
		add: (BrLabelModel text: 'Tab 1');
		stencil: [
			BlElement new
				size: 200@200;
				background: (Color blue alpha: 0.5) ];
		actionsStencil: [ 
			| aToolbar aToolbarItem |
			aToolbar := BrToolbar new.
			aToolbar look: BrToolbarLook horizontal.
			aToolbarItem := BrToolbarItem new.
			aToolbarItem stencil: [
				BrButton new 
					look: BrMaterialToggleLabelledLook;
					label: 'Hello'; 
					action: [ self inform: 'Click on Hello' ] ].
			aToolbarItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
			aToolbar addItem: aToolbarItem.
				
			aToolbarItem := BrToolbarItem new.
			aToolbarItem stencil: [
				BrButton new 
					look: BrMaterialToggleLabelledLook;
					label: 'World'; 
					action: [ self inform: 'Click on World' ] ].
			aToolbarItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
			aToolbar addItem: aToolbarItem ].

	tab2 := BrTabModel new
		add: (BrLabelModel text: 'Tab 2');
		add: BrActivationModel disabled.

	tab3 := BrTabModel new
		add: (BrLabelModel text: 'Tab 3');
		stencil: [ BlElement new
			size: 200@200;
			background: (Color red alpha: 0.5) ].

	tabGroup := BrTabGroupModel with: { tab1 . tab2. tab3 }.

	tabGroup tabs do: [ :aTab |
		BlElement new
			look: BrMaterialTabLabelledLook;
			viewModel: aTab ].

	tabGroupElement := BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup.
	
	self assert: tabGroupElement children size = 2.
	self assert: tabGroupElement children first children size = 2.
	^ tabGroupElement