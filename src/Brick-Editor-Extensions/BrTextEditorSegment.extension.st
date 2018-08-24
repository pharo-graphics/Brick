Extension { #name : #BrTextEditorSegment }

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditorSegment >> gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: 5>  
	 composite text
		title: 'Text';
		format: self text asString
]
