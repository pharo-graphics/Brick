accessing
segment: anEditorSegment
	| mayRebind aCursor |
	
	mayRebind := (segment == anEditorSegment
		and: [ anEditorSegment hasPieces
			and: [ pieces == anEditorSegment pieces ] ]).

	segment := anEditorSegment.
	
	mayRebind
		ifTrue: [ self rebind: anEditorSegment ]
		ifFalse: [ self bind: anEditorSegment ].
		
	aCursor := self editor cursor.
	pieceElements
		detect: [ :aTextElement | aCursor insideSubText: aTextElement text of: segment ]
		ifFound: [ :aTextElement |
			| cursorPosition |
			cursorPosition := aTextElement text isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ aCursor position - aTextElement text start + 1 ].
			
			aTextElement showCursorAt: cursorPosition.
			aTextElement requestFocus ].
		
	self updateSelection: pieceElements