instance creation
singleLineWithMediumIcon
	^ self new looks: {
		BrMaterialListSingleLineItemLook new beMedium.
		BrMaterialListItemIconLook new beMedium.
		BrMaterialListItemLabelLook new }