builder - enumeration
segmentsCollect: aBlock displayedValue: aDisplayedValue in: aSegmentsCollector
	| aDisplayedValueIterator aSegmentIndex |

	aSegmentIndex := aSegmentsCollector removeSegmentsFor: self.
	
	aSegmentsCollector wantsMore
		ifFalse: [ ^ self ].

	aDisplayedValueIterator := self displayedValueIterator: aDisplayedValue.

	[ aSegmentsCollector wantsMore and: [ (self hasSegmentValue: aDisplayedValue at: aSegmentIndex iterator: aDisplayedValueIterator) ] ] whileTrue: [ 
		| aSegmentValue aSegment |

		aSegmentValue := self segmentValue: aDisplayedValue at: aSegmentIndex iterator: aDisplayedValueIterator.

		aSegment := (aSegmentIndex = 1 and: [ aSegmentsCollector isNotEmpty and: [ self inlined ] ])
			ifTrue: [ aSegmentsCollector segments at: aSegmentIndex ]
			ifFalse: [
				(aSegmentsCollector segment: aSegmentValue for: self at: aSegmentIndex)
					type: BrEditorSegmentType uniqueInstance ].

		aBlock cull: aSegment cull: aSegmentValue cull: aSegmentIndex.

		aSegmentIndex := aSegmentIndex + 1 ]