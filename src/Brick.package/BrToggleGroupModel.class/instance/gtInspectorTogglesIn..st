gt-inspector-extension
gtInspectorTogglesIn: aComposite
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Toggles';
		display: [ self toggles ]