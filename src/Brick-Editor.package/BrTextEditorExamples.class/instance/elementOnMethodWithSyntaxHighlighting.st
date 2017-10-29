examples
elementOnMethodWithSyntaxHighlighting
	<gtExample>
	| element styler text editor |
	text := self newMethodText.
	element := self newElement.
	editor := self newEditor.
	styler := BrRBTextStyler new.
	styler classOrMetaClass: Object.
	editor styler: styler.
	editor text: text.
	element editor: editor.
	^ element