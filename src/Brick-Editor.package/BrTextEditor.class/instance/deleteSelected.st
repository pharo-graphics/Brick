api - modification
deleteSelected
	"Delete selected piece of text updating selection and cursor position"
	| aCursorDelta |

	aCursorDelta := 0.
	self selection do: [ :aMonotoneSelection |
		(aMonotoneSelection to <= self cursor position)
			ifTrue: [ aCursorDelta := aCursorDelta + (aMonotoneSelection to - aMonotoneSelection from) ]
			ifFalse: [ aMonotoneSelection from < self cursor position
				ifTrue: [ aCursorDelta := aCursorDelta + (self cursor position - aMonotoneSelection from) ] ] ].

	self moveCursorTo: self cursor position - aCursorDelta.

	self selection reverseDo: [ :aMonotoneSelection |
		self
			delete: aMonotoneSelection from
			to: aMonotoneSelection to ].

	self selectNone