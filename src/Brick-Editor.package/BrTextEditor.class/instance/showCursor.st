text - cursor
showCursor
	| aCommand |

	self cursor isVisible: true.
	
	aCommand := self newCursorChangeCommand
		position: self cursor position.
	self enqueueCommand: aCommand