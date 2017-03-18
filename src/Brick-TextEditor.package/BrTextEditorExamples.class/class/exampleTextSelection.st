example
exampleTextSelection
	<example>
	| space editor |
	space := BlSpace new
		extent: 800 @ 650;
		title: 'Moldable editor'.

	editor := BrTextEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself.
	editor addEventHandler: (BrSelectionHandler on: editor).

	space root addChild: editor.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	"space root
		addChild: (BlBenchmarkConsole on: space)."
	space show