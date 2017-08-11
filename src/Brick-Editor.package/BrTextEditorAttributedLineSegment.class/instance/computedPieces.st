pieces - computation
computedPieces
	<return: #SequenceableCollection of: #BrTextEditorAttributedLineSegmentPiece>
	| thePieces |
	
	thePieces := Array streamContents: [ :aStream |
		| lineIterator |
		
		lineIterator := self text iterator.
		[ self hasNext: lineIterator ] whileTrue: [
			aStream nextPut: (self itemValue: lineIterator) ] ].

	^ thePieces