examples - material
toggleWithMaterialLabelAndIcon
	<gtExample>

	^ self toggleButton
		look: BrMaterialToggleIconifiedLook + BrMaterialToggleLabelledLook;
		viewModelDo: [ :aModel | aModel icon: self toggleButtonIcon ]