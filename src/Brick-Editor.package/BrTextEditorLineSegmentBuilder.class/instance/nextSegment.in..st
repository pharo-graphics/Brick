splitting
nextSegment: anIterator in: aStream
	| aSegment |
	
	aSegment := self nextSegment: anIterator.
	aStream nextPut: aSegment 