examples - ui
materialGroup
	<gtExample>
	| tab1 tab2 tab3 tabGroup groupElement |

	tab1 := BrTabModel new
		label: 'Tab 1';
		content: [ BlElement new
			size: 200@200;
			background: (Color red alpha: 0.5) ].

	tab2 := BrTabModel new label: 'Tab 2'; disable.
	tab3 := BrTabModel new label: 'Tab 3'.

	tabGroup := BrTabGroupModel with: { tab1 . tab2. tab3 }.

	groupElement := BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup.

	"binding order does not matter"
	BlElement new
		look: BrMaterialTabLabelledLook;
		viewModel: tab2.

	BlElement new
		look: BrMaterialTabLabelledLook;
		viewModel: tab1.

	BlElement new
		look: BrMaterialTabLabelledLook;
		viewModel: tab3.

	^ groupElement