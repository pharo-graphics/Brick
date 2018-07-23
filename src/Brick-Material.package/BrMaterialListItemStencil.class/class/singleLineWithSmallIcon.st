instance creation
singleLineWithSmallIcon
	^ self new looks: {
		BrMaterialListSingleLineItemLook new beSmall.
		BrMaterialListItemIconLook new beSmall.
		BrMaterialListItemLabelLook new }