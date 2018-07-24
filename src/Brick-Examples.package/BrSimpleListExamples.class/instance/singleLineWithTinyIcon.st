examples - material
singleLineWithTinyIcon
	<gtExample>

	^ BrSimpleList new
		stencil: [ :each :index |			
			BrMaterialListItemStencil singleLineWithTinyIcon
				label: each key asString;
				icon: (BlScalableElement new contentElement: (BlElement new background: each value; size: each value extent)) ];
		display: (Smalltalk ui icons icons associations)