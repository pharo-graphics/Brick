configuration
packageNames
	^ ((#gtExample senders select: [ :each | each package name beginsWith: 'Brick-Editor' ])
		groupedBy: [ :each | each package name ]) keys