accessing
toolbarItemGToolkit
	<gtExample>
	| aToolbarItem |
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'GToolkit'; 
			action: [ self inform: 'Click on GToolkit' ] ].
	^ aToolbarItem