accessing
toolbarItem
	<gtExample>
	<label: 'Basic toolbar item'>
	| aToolbarItem |
	aToolbarItem := BrToolbarItem new.
	aToolbarItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
	self assert: aToolbarItem viewModel stencil notNil.
	^ aToolbarItem