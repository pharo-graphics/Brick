gt-inspector-extension
gtInspectorItemsIn: aComposite
	<gtInspectorPresentationOrder: 2>

	^ aComposite fastList
		title: 'Items';
		display: [ self items ]