*Brick-Editor-Extensions
brickEditorFormElementOn: aBuilder
	<brickEditorElementOrder: 10>

	aBuilder dynamic
		element: [ :aForm | BrFormElement new
			size: aForm extent;
			form: aForm ]