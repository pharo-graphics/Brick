private
updateCursor
	| aCursorDelta |

	aCursorDelta := self computeCursorMovement: self cursor.
	aCursorDelta isZero ifFalse: [
		self editor moveCursorTo: self cursor position + aCursorDelta ]