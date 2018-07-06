examples
editorWithAdormentDynamicAttribute
	<gtExample>
	| editor text |
	text := self newThreeLineText.
	editor := self newEditor text: text.
	editor text
		attributes: { 
			BrTextAdornmentDynamicAttribute new 
				stencil: [ 
					BlElement new 
						size: 70 @ 50; 
						margin: (BlInsets all: 5);
						background: Color red ] }
		from: 1
		to: text size.
	^ editor