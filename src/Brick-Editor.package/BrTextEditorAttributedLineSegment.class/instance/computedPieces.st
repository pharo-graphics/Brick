pieces - computation
computedPieces
	<return: #SequenceableCollection of: #BrTextEditorLineSegmentPiece>
	| thePieces |
	
	thePieces := Array streamContents: [ :aStream |
		| lineIterator |
		
		lineIterator := self text iterator.
		[ lineIterator hasNext ] whileTrue: [
			self nextSegmentPiece: lineIterator in: aStream ] ].

	^ thePieces
		ifEmpty:[ { self textPiece: (self text from: 0 to: 0) } ]
		ifNotEmpty: #yourself