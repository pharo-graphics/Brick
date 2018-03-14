examples - material
toggleWithMaterialChangingIcon
	<gtExample>

	^ self toggleButton
		look: (BrMaterialToggleLabelledLook + BrMaterialToggleIconifiedLook
			when: BrToggleActivatedEvent do: [ :anEvent | 
				anEvent currentTarget widget viewModel icon: self squareIcon ];
			when: BrToggleDeactivatedEvent do: [ :anEvent | 
				anEvent currentTarget widget viewModel icon: self circleIcon ])