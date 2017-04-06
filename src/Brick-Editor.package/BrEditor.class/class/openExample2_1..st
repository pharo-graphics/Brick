instance creation
openExample2_1: anObject
	| space editor |
	space := BlSpace new
		extent: 480 @ 310;
		title: 'Moldable editor'.
	
	editor := BrEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		margin: (BlInsets top: 20 right: 5 bottom: 20 left: 10);
		yourself.
		
	editor editor subject: anObject.
	
	space root layout: BlLinearLayout horizontal.
	space root addChild: editor.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show.
	
	space root forceLayout.
	space root asSpartaForm writePNGFileNamed: 'generic_code_with_files.png'