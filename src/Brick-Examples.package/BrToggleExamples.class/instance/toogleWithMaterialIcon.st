examples - material
toogleWithMaterialIcon
	<gtExample>
	^ self toggleButton
		look: BrMaterialToggleIconifiedLook new;
		viewModelDo: [ :aModel | aModel icon: self toggleButtonIcon ]