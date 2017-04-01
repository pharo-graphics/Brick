*Brick-Editor-Extensions
brickEditorObjectElementOn: aBuilder
	<brickEditorElementOrder: 1000>
	
	aBuilder text
		display: [ :anObject | BrRopedText string: anObject asString ];
		initializeElement: [ BlTextElement new ]