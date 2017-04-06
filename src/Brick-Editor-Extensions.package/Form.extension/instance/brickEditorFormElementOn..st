*Brick-Editor-Extensions
brickEditorFormElementOn: aBuilder
	<brickEditorElementOrder: 10>

	aBuilder dynamic
		element: [ :aForm | BrFormElement new
			size: aForm extent;
			margin: (BlInsets top: 5 right: 5 bottom: 5 left: 17);
			form: aForm ]