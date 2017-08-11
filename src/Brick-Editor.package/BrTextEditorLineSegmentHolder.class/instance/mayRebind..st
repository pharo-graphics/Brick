testing
mayRebind: aBrTextEditorSegment
	^ (segment == aBrTextEditorSegment
		and: [ aBrTextEditorSegment hasPieces
			and: [ pieces == aBrTextEditorSegment pieces ] ])