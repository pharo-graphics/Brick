mouse handlers
clickEvent: anEvent
	self action 
		cull: anEvent currentTarget text
		cull: anEvent currentTarget
		cull: anEvent
	"anEvent currentTarget text
		attributes: { BrTextForegroundAttribute paint: Color random paler }"