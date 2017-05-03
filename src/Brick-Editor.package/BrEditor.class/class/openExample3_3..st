instance creation
openExample3_3: anObject
	| space editor |
	space := BlSpace new
		extent: (800.0@800);
		title: 'Moldable editor'.
	
	editor := BrEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		position: 20@20;
		margin: (BlInsets top: 10 right: 5 bottom: 10 left: 10);
		yourself.
		
	
	editor	 doItReceiver: editor.
		
	editor editor subject: anObject.
	
	"space root layout: BlFrameLayout new."
	space root addChild: editor.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show.
	
	space root forceLayout.
	"space root asSpartaForm writePNGFileNamed: 'two_dates_expanded.png'"