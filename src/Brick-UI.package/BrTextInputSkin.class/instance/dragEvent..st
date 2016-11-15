dnd handlers
dragEvent: anEvent
	|  txPos |
	
	anEvent isPrimaryButtonDrag ifFalse: [^ self].   
	txPos := text textPositionAt:  (textContainer globalPointToLocal: anEvent position) .
	anEvent dragboard hasClipData 
		ifTrue:[self moveCaretCursorTo: txPos] 
		ifFalse:[controller extendSelectionTo: txPos]