examples - collector
emptyCollectorFirstIndex: aCollector
	<gtExample>
	<dependsOn: #collector:text:>
	| index |
	
	index := aCollector firstIndex.
	self assert: index equals: 0.
	
	^ index