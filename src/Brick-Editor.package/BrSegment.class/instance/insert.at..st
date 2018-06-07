accessing
insert: aCollectionOfSegments at: anIndex
	<return: #Collection of: #BrSegment>
	
	self
		assert: [ aCollectionOfSegments isNotEmpty ]
		description: [ 'Can not insert an empty collection of segments' ].