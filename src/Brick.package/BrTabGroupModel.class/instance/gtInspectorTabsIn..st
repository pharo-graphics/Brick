gt-inspector-extension
gtInspectorTabsIn: aComposite
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Tabs';
		display: [ self tabs ]