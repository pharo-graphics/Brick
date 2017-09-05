events
handleEvent: anEvent
	"Handle a given event or dispatch it using #sendTo:"
	
	anEvent sendTo: self