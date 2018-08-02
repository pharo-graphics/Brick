I am a stencil builder designed to be used together with dynamic adornment attribute.

Example:
[[[
	stencilBuilder := BrTextAdornmentStencilBuilder new.
	stencilBuilder
		text: aBlText;
		editor: anEditorElement.
	adornmentElement := stencilBuilder asElement
]]]

The use of me together with adornment attribute assuming that a subclass of me is used:
[[[
	attribute := BrTextAdornmentDynamicAttribute new.
	attribute stencil: BrTextAdornmentStencilBuilder new
]]]

Users can also directly use blocks for scripting:

[[[
	attribute := BrTextAdornmentDynamicAttribute new.
	attribute stencil: [ :aText :anEditorElement | BlElement new  ]
]]]