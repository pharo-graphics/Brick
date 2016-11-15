caret position
moveCaretTo: aTextPosition andResetSelection: aBoolean
"@todo check current position. if position does not exists, move cursor to start|end"
	widget moveCaretTo: aTextPosition.
	aBoolean
		ifTrue: [ widget selectionProperty notifyValueChanged ]