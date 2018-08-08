accessing
removeItemsOnButtonClickVertically
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar aToolbarItem |
	aToolbar := self addItemsOnButtonClickVertically.
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'Remove'; 
			action: [ | aSize anIndex aWidget |
				aSize := aToolbar numberOfItems.
				anIndex := ((aSize - 3) max: 0) atRandom + 3.
				anIndex <= aSize ifTrue: [ 
					aWidget := aToolbar itemAt: anIndex.
					aWidget ifNotNil: [
						aToolbar removeItem: aWidget.
						self assert: aToolbar numberOfItems equals: aSize - 1 ] ] ] ].
	aToolbar addItem: aToolbarItem.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar