dnd handlers
dragStartEvent: anEvent
	| evtPos aTextPosition sString|
	anEvent isPrimaryButtonDrag ifFalse: [ ^ self ].
	
	evtPos := textContainer globalPointToLocal: anEvent position.
	aTextPosition := text textPositionAt: evtPos - self textOffset.
	(widget editorModel selection contains:aTextPosition) ifFalse:[^ self].
	sString := widget editorModel selection asString ifEmpty: [^ self].
	anEvent dragboard 
		clipData: sString;
		dragView: (BlDragView on:(BlText text: sString) forceLayout asForm)
	