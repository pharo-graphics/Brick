gt-inspector-extension
gtInspectorChildrenIn: aComposite
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Children';
		display: [ self children ];
		when: [ self children isNotEmpty ]