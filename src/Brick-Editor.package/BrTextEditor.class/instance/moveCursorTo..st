text - cursor
moveCursorTo: aTextIndex
	"Moves cursor to a given position without any further action such as cancelling selection"
	| aCommand |

	aCommand := self newCursorMoveCommand
		position: aTextIndex.
	self enqueueCommand: aCommand