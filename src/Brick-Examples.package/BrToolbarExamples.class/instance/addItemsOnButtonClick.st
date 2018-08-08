accessing
addItemsOnButtonClick
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar aToolbarItem |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarLook + BrToolbarLook horizontal.
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'Add'; 
			action: [ | aSize |
				aSize := aToolbar numberOfItems.
				aToolbar addItem: (
					self toolbarItem stencil: [ | aLabel |
						aLabel := aToolbar numberOfItems asString.
						BrButton new 
							look: BrMaterialToggleLabelledLook;
							label: aLabel; 
							action: [ self inform: 'Click on button ', aLabel ] ] ).
				self assert: aToolbar numberOfItems equals: aSize + 1 ] ].
	aToolbar addItem: aToolbarItem.
	self assert: aToolbar numberOfItems equals: 1.
	^ aToolbar