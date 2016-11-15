caret management
moveCaretCursorTo: aTextPosition
	| layoutPos caretPos |
	layoutPos := text layoutView layout positionAt: aTextPosition ifOutside: [ ^ self ].
	caret height: layoutPos line height.
	caretPos := (layoutPos topPointInView x min: textContainer width - 1 max: 1)
		@ (layoutPos topPointInView y min: textContainer height - 1 max: 1).
	(self needsScrollFor: caretPos)
		ifTrue: [ self scrollBy2: layoutPos topPointInView ].
	caret relocate: caretPos