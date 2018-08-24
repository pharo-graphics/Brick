Class {
	#name : #BrToolbarExamples,
	#superclass : #Object,
	#category : 'Brick-Examples'
}

{ #category : #accessing }
BrToolbarExamples >> addItemsOnButtonClick [
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
]

{ #category : #accessing }
BrToolbarExamples >> addItemsOnButtonClickVertically [
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar aToolbarItem |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarLook + BrToolbarLook vertical.
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
]

{ #category : #accessing }
BrToolbarExamples >> removeItemsOnButtonClick [
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar aToolbarItem |
	aToolbar := self addItemsOnButtonClick.
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
]

{ #category : #accessing }
BrToolbarExamples >> removeItemsOnButtonClickVertically [
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
]

{ #category : #accessing }
BrToolbarExamples >> toolbar [
	<gtExample>
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarLook + BrToolbarLook horizontal.
	aToolbar addItem: self toolbarItemHello.
	aToolbar addItem: self toolbarItemGToolkit.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar
]

{ #category : #accessing }
BrToolbarExamples >> toolbarInAContainer [
	<gtExample>
	| aContainer |
	aContainer := BlElement new.
	aContainer layout: BlLinearLayout horizontal.
	aContainer debug: true.
	aContainer constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ].
	aContainer addChild: (self removeItemsOnButtonClickVertically debug: true) as: #toolbar.
	^ aContainer
]

{ #category : #accessing }
BrToolbarExamples >> toolbarItem [
	<gtExample>
	<label: 'Basic toolbar item'>
	| aToolbarItem |
	aToolbarItem := BrButton new.
	aToolbarItem look: BrMouseHoverLook + BrMouseClickLook.
	self assert: aToolbarItem viewModel stencil notNil.
	^ aToolbarItem
]

{ #category : #accessing }
BrToolbarExamples >> toolbarItemGToolkit [
	<gtExample>
	| aToolbarItem |
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'GToolkit'; 
			action: [ self inform: 'Click on GToolkit' ] ].
	^ aToolbarItem
]

{ #category : #accessing }
BrToolbarExamples >> toolbarItemHello [
	<gtExample>
	| aToolbarItem |
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'Hello'; 
			action: [ self inform: 'Click on Hello' ] ].
	^ aToolbarItem
]

{ #category : #accessing }
BrToolbarExamples >> verticalToolbar [
	<gtExample>
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarLook + BrToolbarLook vertical.
	aToolbar addItem: self toolbarItemHello.
	aToolbar addItem: self toolbarItemGToolkit.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar
]
