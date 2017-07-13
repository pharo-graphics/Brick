examples - collector
computeInterval: anIndex collector: aCollector
	<gtExample>
	<dependsOn: #segmentIndex>
	<dependsOn: #collector:text:>

	^ aCollector computeInterval: anIndex.