gt-inspector-extension
gtInspectorModelsIn: aComposite
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Models';
		display: [ self widgetModels ];
		when: [ self widgetModels isNotEmpty ]