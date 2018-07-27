text - copy/paste
paste: aTextIndex
	"A paste a text from the clipboard at the given index deletinh any currently selected text"
	| aString aCursorDelta |

	aString := Clipboard clipboardText asString.

	self insertString: aString at: aTextIndex.
	self moveCursorTo: aTextIndex + aString size.
	
	aCursorDelta := 0.
	self selection do: [ :aMonotoneSelection |
		(aMonotoneSelection to <= self cursor position)
			ifTrue: [ aCursorDelta := aCursorDelta + (aMonotoneSelection to - aMonotoneSelection from) ]
			ifFalse: [ aMonotoneSelection from < self cursor position
				ifTrue: [ aCursorDelta := aCursorDelta + (self cursor position - aMonotoneSelection from) ] ] ].

	self moveCursorTo: self cursor position - aCursorDelta.

	self deselect: aTextIndex to: aTextIndex + aString size.
	self deleteSelected.
	self selectNone