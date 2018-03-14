examples - material
toggleWithMaterialChangingIcon
	<gtExample>

	^ self toggleButton
		when: BrToggleActivatedEvent do: [ :anEvent | anEvent currentTarget viewModel icon: self squareIcon ];
		when: BrToggleDeactivatedEvent do: [ :anEvent | anEvent currentTarget viewModel icon: self circleIcon ];
		look: BrMaterialToggleLabelledLook + BrMaterialToggleIconifiedLook