Extension { #name : #BrColumnedModel }

{ #category : #'*Brick-Extensions' }
BrColumnedModel >> gtInspectorColumnsIn: aComposite [
	<gtInspectorPresentationOrder: 2>

	^ aComposite fastTable
		title: 'Columns';
		display: [ self columns ];
		column: '' evaluated: [ '' ] width: 1;
		column: 'Title' evaluated: #title
]
