examples - collector
emptyCollectorSegmentsCount: aCollector
	<gtExample>
	<dependsOn: #collector:text:>
	| count |
	
	count := aCollector segmentsCount.
	self assert: count equals: (self cacheLimit min: self newText asString lineCount).

	^ count