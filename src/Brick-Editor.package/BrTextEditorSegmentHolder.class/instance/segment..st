accessing
segment: anEditorSegment
	| mayRebind aCursor aSelectionInterval |
	
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
			aTextElement showCursorAt: aCursor position - aTextElement text start + 1.
			aTextElement requestFocus ].
	
	aSelectionInterval := self editor selection interval.
	pieceElements
		select: [ :aTextElement |
			(aSelectionInterval rangeIncludes: aTextElement text start)
				or: [ (aSelectionInterval rangeIncludes: aTextElement text end) ] ]
		thenDo: [ :aTextElement |
			| localSelection |
			localSelection := ((aSelectionInterval first - aTextElement text start) max: 0)
				to: ((aSelectionInterval last - aTextElement text start) min: aTextElement text size + 1).
			aTextElement select: localSelection first to: localSelection last ]