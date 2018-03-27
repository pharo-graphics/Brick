configuration
packageNames
	^ ((#gtExample senders select: [ :each | each package name beginsWith: 'Brick' ])
		groupedBy: [ :each | each package name ]) keys