builder - enumeration
segmentsCollect: aBlock of: aObject in: aSegmentsCollector
	| aDisplayedValue aDisplayedValueIterator aSegmentIndex |

	aDisplayedValue := self displayedValue: aObject.
	aDisplayedValueIterator := self displayedValueIterator: aDisplayedValue.

	aSegmentIndex := 1.

	[ aSegmentsCollector wantsMore and: [ (self hasSegmentValue: aDisplayedValue at: aSegmentIndex iterator: aDisplayedValueIterator) ] ] whileTrue: [ 
		| aSegmentValue aSegment |

		aSegmentValue := self segmentValue: aDisplayedValue at: aSegmentIndex iterator: aDisplayedValueIterator.

		aSegment := (aSegmentIndex = 1 and: [ aSegmentsCollector isNotEmpty and: [ self inlined ] ])
			ifTrue: [ aSegmentsCollector segments last ]
			ifFalse: [ (aSegmentsCollector segment: aSegmentValue for: self) type: BrEditorSegmentType uniqueInstance ].

		aBlock cull: aSegment cull: aSegmentValue cull: aSegmentIndex.

		aSegmentIndex := aSegmentIndex + 1 ]