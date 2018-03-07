event handling
toggleActivated
	super toggleActivated.
	
	widget background: self checkedBackground.
	label textDo: [ :aText | aText foreground: self checkedForeground ]