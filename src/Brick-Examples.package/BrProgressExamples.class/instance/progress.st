element
progress
	<gtExample>
	| aContainer aBarElement |
	aBarElement := self bar.
	aContainer := self container.
	aContainer 
		size: 320@10;
		addChild: aBarElement as: BrProgressLook widgetProgressName.
	aContainer viewModel: self progressModel.
	aContainer look: BrProgressLook.
	^ aContainer