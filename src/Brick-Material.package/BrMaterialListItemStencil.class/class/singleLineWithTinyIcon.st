instance creation
singleLineWithTinyIcon
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beTiny.
		BrMaterialListItemIconLook new beTiny.
		BrMaterialListItemLabelLook new } ]