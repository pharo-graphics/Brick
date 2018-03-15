examples - material
toggleWithMaterialIconAndLabel
	<gtExample>
	^ self toggleButton
		look: BrMaterialToggleIconifiedLook + BrMaterialToggleLabelledLook;
		viewModelDo: [ :aModel | aModel icon: self toggleButtonIcon ]