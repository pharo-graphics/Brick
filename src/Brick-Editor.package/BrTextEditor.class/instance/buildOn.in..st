builder
buildOn: aBrText in: aSegmentsCollector
	| iterator |

	text := aBrText.
	iterator := aBrText iterator.
	
	[ aSegmentsCollector wantsMore and: [ iterator hasNext ] ]
		whileTrue: [
			| lineText lineIterator collectorSegment textSegment |
			lineText := iterator nextLine.
			textSegment := BrTextEditorSegment new.
			textSegment segment: lineText.
			
			lineIterator := lineText iterator.
			[ lineIterator hasNext ]
				whileTrue: [ textSegment addPiece: lineIterator nextWord ].
			
			collectorSegment := aSegmentsCollector segment: textSegment for: self.
			collectorSegment type: BrEditorSegmentType uniqueInstance.
			collectorSegment
				items: textSegment pieces
				from: self
				for: textSegment ]