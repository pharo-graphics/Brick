examples - collector
emptyCollectorLastIndex: aCollector
	<gtExample>
	<dependsOn: #collector:text:>
	| index |
	
	index := aCollector lastIndex.
	self assert: index equals: 0.
	
	^ index