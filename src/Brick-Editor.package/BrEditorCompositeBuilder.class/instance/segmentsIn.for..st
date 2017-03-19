builder - segments
segmentsIn: aSegmentCollector for: aSubject
	self builders do: [ :aBuilder | 
		aSegmentCollector wantsMore
			ifFalse: [ ^ self ].

		aBuilder
			segmentsIn: aSegmentCollector
			for: aSubject ]