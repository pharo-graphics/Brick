private
updateCursor
	| aCursorDelta |

	aCursorDelta := self computeCursorMovement: self editor cursor.
	aCursorDelta isZero ifFalse: [
		self editor moveCursorTo: self editor cursor position + aCursorDelta ]