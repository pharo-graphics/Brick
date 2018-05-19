gt-inspector-extension
gtInspectorTabsIn: aComposite
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Tabs' translated;
		display: [ self tabs ]