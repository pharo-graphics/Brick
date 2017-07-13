examples - collector
emptyCollectorForwardSegments: aCollector interval: anInterval
	<gtExample>
	<dependsOn: #collector:text:>
	<dependsOn: #computeInterval:collector:>
	| collection |
	
	collection := aCollector forwardSegments: anInterval.
	self assert: collection size equals: 0.
	
	^ collection