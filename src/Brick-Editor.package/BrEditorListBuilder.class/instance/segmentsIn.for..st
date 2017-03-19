builder - segments
segmentsIn: aSegmentCollector for: aSubject
	| aCollection |
	
	aCollection := self displayBlock cull: aSubject.
	aCollection do: [ :anObject |
		self builders do: [ :aBuilder | 
			aSegmentCollector wantsMore
				ifFalse: [ ^ self ].

			aBuilder
				segmentsIn: aSegmentCollector
				for: anObject ] ]