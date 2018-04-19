gt-inspector-extension
gtInspectorStencilElementPreviewIn: aComposite
	<gtInspectorPresentationOrder: 1>

	^ aComposite bloc
		title: 'Preview';
		display: [ self create ];
		when: [ self create isKindOf: BlElement ]