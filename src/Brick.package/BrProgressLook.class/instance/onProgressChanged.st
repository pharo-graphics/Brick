hooks
onProgressChanged
	self widgetDo: [ :aWidget | 
		self widgetProgress constraintsDo: [ :c | 
			c frame horizontal weight: self percentage ] ]