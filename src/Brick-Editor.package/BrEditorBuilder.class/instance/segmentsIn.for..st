builder - segments
segmentsIn: aSegmentCollector for: aSubject
	"Every builder is responsible for segment creation and addition them to a segment collector.
	Before adding a new segment users should check whether collector #wantMore of them.
	Segments can contain one or more items"
	| aBrText aSegmentsIterator isFirst segmentIndex |

	aBrText := self displayedValue: aSubject.
	aSegmentsIterator := self displayedValueIterator: aBrText.

	isFirst := true.
	segmentIndex := 1.

	[ aSegmentCollector wantsMore and: [ (self hasSegmentValue: aBrText at: segmentIndex iterator: aSegmentsIterator) ] ] whileTrue: [ 
		| aBrTextSegment aSegment theItems |

		aBrTextSegment := self segmentValue: aBrText at: segmentIndex iterator: aSegmentsIterator.

		theItems := Array streamContents: [ :aStream |
			| aBrTextItemsIterator anItemIndex |
			anItemIndex := 1.
			aBrTextItemsIterator := self segmentValueIterator: aBrTextSegment.
			[ self hasItemValue: aBrTextSegment at: anItemIndex iterator: aBrTextItemsIterator ] whileTrue: [ 
				aStream nextPut: (self itemValue: aBrTextSegment at: anItemIndex iterator: aBrTextItemsIterator).
				anItemIndex := anItemIndex + 1 ] ].

		aSegment := (isFirst and: [ aSegmentCollector isNotEmpty and: [
				self inlined or: [ aSegmentCollector segments last builder inlined ] ] ])
			ifTrue: [ aSegmentCollector segments last ]
			ifFalse: [ (aSegmentCollector segment: aBrTextSegment for: self) type: BrEditorSegmentType uniqueInstance ].

		aSegment items: theItems from: self.
		segmentIndex := segmentIndex + 1.
		isFirst := false ]