text - cursor
hideCursor
	| aCommand |

	self cursor isVisible: false.

	aCommand := self newCursorChangeCommand
		position: self cursor position.
	self enqueueCommand: aCommand