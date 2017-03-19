builder - segments
segmentsIn: aSegmentCollector for: aSubject
	| aBrText aSegmentsIterator |

	aBrText := displayBlock cull: aSubject.
	aSegmentsIterator := segmentsIteratorBlock cull: aBrText.

	[ (segmentsIteratorWhileBlock cull: aSegmentsIterator) and: [
			aSegmentCollector wantsMore ] ] whileTrue: [ 
		| aBrTextSegment aSegment theItems |
		aBrTextSegment := segmentsBlock cull: aSegmentsIterator.
		aSegment := aSegmentCollector segment: aBrTextSegment.
		theItems := Array streamContents: [ :aStream |
			| aBrTextItemsIterator |
			aBrTextItemsIterator := itemsIteratorBlock cull: aBrTextSegment.
			[ itemsIteratorWhileBlock cull: aBrTextItemsIterator ] whileTrue: [ 
				aStream nextPut: (itemsBlock cull: aBrTextItemsIterator) ] ].
		
		aSegment type: BrEditorSegmentType uniqueInstance.
		aSegment items: theItems.
		aSegment layout: (layoutBlock cull: aSubject) ]