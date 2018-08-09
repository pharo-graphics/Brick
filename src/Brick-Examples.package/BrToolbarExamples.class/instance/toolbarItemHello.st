accessing
toolbarItemHello
	<gtExample>
	| aToolbarItem |
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'Hello'; 
			action: [ self inform: 'Click on Hello' ] ].
	^ aToolbarItem