examples - material
toggleWithMaterialLabelAndIcon
	<gtExample>
	^ self toggleButton
		look: BrMaterialToggleLabelledLook + BrMaterialToggleIconifiedLook;
		viewModelDo: [ :aModel | aModel icon: self toggleButtonIcon ]