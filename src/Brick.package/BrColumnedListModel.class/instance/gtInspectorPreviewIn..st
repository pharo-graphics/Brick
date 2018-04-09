gt-inspector-extension
gtInspectorPreviewIn: aComposite
	<gtInspectorPresentationOrder: 1>

	^ aComposite fastTable
		title: 'Preview';
		display: [ self items ];
		column: '' evaluated: [ '' ] width: 1;
		in: [ :aPresentation | 
			self columns do: [ :aColumn |
				aPresentation column: aColumn title evaluated: aColumn evaluated ] ];
		yourself