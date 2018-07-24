instance creation
singleLineWithLargeIcon
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beLarge.
		BrMaterialListItemIconLook new beLarge.
		BrMaterialListItemLabelLook new } ]