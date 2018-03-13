gt-inspector-extension
gtInspectorLooksIn: aComposite
	<gtInspectorPresentationOrder: 5>

	^ aComposite fastList
		title: 'Looks';
		display: [ self looks ];
		when: [ self looks isNotEmpty ]