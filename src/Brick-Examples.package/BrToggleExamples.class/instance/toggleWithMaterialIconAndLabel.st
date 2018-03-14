examples - material
toggleWithMaterialIconAndLabel
	<gtExample>

	^ self toggleButton
		look: BrMaterialToggleLabelledLook + BrMaterialToggleIconifiedLook;
		viewModelDo: [ :aModel | aModel icon: self toggleButtonIcon ]