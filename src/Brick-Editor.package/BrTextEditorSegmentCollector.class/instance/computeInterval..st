cache - computation
computeInterval: anIndex
	| start end |
	
	start := anIndex - (self cacheLimit / 2) rounded.
	start := start max: 1.
	end := start + self cacheLimit - 1.
	
	^ start to: end