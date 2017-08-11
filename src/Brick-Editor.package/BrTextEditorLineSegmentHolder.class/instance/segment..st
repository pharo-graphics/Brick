accessing
segment: anEditorSegment
	| mayRebind |
	
	mayRebind := self mayRebind: anEditorSegment.
	segment := anEditorSegment.
	
	mayRebind
		ifFalse: [ self bind: anEditorSegment ].

	self updateCursor: pieceElements.
	self updateSelection: pieceElements