accessing
verticalToolbar
	<gtExample>
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarLook + BrToolbarLook vertical.
	aToolbar addItem: self toolbarItemHello.
	aToolbar addItem: self toolbarItemGToolkit.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar