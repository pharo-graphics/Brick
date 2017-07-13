examples - collector
collector: aCollector limit: aLimit
	<gtExample>
	<dependsOn: #newCollector>
	<dependsOn: #cacheLimit>
	
	^ aCollector cacheLimit: aLimit