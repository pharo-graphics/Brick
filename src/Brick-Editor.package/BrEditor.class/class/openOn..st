instance creation
openOn: anObject
	| space editor |
	space := BlSpace new
		extent: 600 @ 500;
		title: 'Moldable editor'.
	
	editor := BrEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		margin: (BlInsets all: 10);
		yourself.
		
	editor editor subject: anObject.
	
	space root layout: BlLinearLayout horizontal.
	space root addChild: editor.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show.
	
	^ space root