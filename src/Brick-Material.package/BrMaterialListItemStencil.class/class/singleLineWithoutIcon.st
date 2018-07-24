instance creation
singleLineWithoutIcon
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beCompact.
		BrMaterialListItemLabelLook new } ]