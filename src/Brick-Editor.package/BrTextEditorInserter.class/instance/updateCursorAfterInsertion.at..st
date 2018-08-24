private
updateCursorAfterInsertion: aText at: anIndex
	| aCursorDelta |

	aCursorDelta := self
		computeIndexMovement: self cursor position
		afterInserted: aText
		at: anIndex.

	aCursorDelta isZero
		ifFalse: [ self editor moveCursorTo: self cursor position + aCursorDelta ]