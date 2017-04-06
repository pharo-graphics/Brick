instance creation
openExample3_2: anObject
	| space editor |
	space := BlSpace new
		extent: (600.0@400);
		title: 'Moldable editor'.
	
	editor := BrEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		margin: (BlInsets top: 10 right: 5 bottom: 10 left: 10);
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
	space root asSpartaForm writePNGFileNamed: 'one_date_expanded.png'