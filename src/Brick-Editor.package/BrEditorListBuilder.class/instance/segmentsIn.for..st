builder - segments
segmentsIn: aSegmentCollector for: anObject
	| aCollection |

	aCollection := self displayedValue: anObject.
	aCollection do: [ :each |
		self builders do: [ :aBuilder | 
			aSegmentCollector wantsMore
				ifFalse: [ ^ self ].

			aBuilder
				segmentsIn: aSegmentCollector
				for: each ] ]