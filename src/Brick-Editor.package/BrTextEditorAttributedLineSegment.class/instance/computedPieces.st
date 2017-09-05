pieces - computation
computedPieces
	<return: #SequenceableCollection of: #BrTextEditorAttributedLineSegmentPiece>
	| thePieces |
	
	thePieces := Array streamContents: [ :aStream |
		| lineIterator |
		
		lineIterator := self text iterator.
		[ self hasNext: lineIterator ] whileTrue: [
			self nextSegmentPiece: lineIterator in: aStream ] ].
	
	^ thePieces
		ifEmpty:[ { (BrTextEditorAttributedLineSegmentTextPiece new text: (self text from: 0 to: 0)) } ]
		ifNotEmpty: #yourself