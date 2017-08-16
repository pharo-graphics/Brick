*Brick-Editor-Pillar
gtInspectorPillarCommentWithBlocIn: composite
	<gtInspectorPresentationOrder: 40>
	^ composite bloc
		title: 'Comment (Bloc)';
		element: [ 
			| text styler editor editorElement |
			text := BrRopedText string: self comment.
			styler := BrPillarStyler new fileReference: FileSystem workingDirectory.
			editor := BrTextEditor new.
			editor styler: styler.
			editor text: text.
			editorElement := BrEditorElement new.
			editorElement constraintsDo: [ :c |
			    c horizontal matchParent.
			    c vertical matchParent ].
			editorElement editor: editor ]