private
performLeaveAction: anEvent
	self leaveAction
		cull: anEvent currentTarget text
		cull: anEvent currentTarget
		cull: anEvent