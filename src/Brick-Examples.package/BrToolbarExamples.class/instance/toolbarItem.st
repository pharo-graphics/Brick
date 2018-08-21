accessing
toolbarItem
	<gtExample>
	<label: 'Basic toolbar item'>
	| aToolbarItem |
	aToolbarItem := BrButton new.
	aToolbarItem look: BrMouseHoverLook + BrMouseClickLook.
	self assert: aToolbarItem viewModel stencil notNil.
	^ aToolbarItem