event handling
toggleDeactivated
	super toggleDeactivated.
	
	widget background: self normalBackground.
	label textDo: [ :aText | aText foreground: self normalForeground ]