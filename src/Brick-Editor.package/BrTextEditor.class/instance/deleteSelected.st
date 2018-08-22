api - modification
deleteSelected
	"Delete selected piece of text updating selection and cursor position"
	| aCursorDelta theSelections |

	self selection isEmpty
		ifTrue: [ ^ self ].

	aCursorDelta := 0.
	self selection do: [ :aMonotoneSelection |
		(aMonotoneSelection to <= self cursor position)
			ifTrue: [ aCursorDelta := aCursorDelta + (aMonotoneSelection to - aMonotoneSelection from) ]
			ifFalse: [ aMonotoneSelection from < self cursor position
				ifTrue: [ aCursorDelta := aCursorDelta + (self cursor position - aMonotoneSelection from) ] ] ].

	"do not move cursor if delta is zero"
	aCursorDelta isZero
		ifFalse: [ self moveCursorTo: self cursor position - aCursorDelta ].

	theSelections := Array streamContents: [ :aStream |
		self selection reverseDo: [ :aMonotoneSelection |
			aStream nextPut: aMonotoneSelection interval ] ].

	"we shall deselect it first, then delete"
	self selectNone.

	theSelections do: [ :anInterval |
		self
			delete: anInterval  first
			to: anInterval  last ]