accessing
segment: aSegment
	| theItemElements |
	
	self releaseCaches.

	segment := aSegment.

	self layout: segment layout.

	theItemElements := Array streamContents: [ :aStream |
		
		segment itemsDo: [ :anItem :aBuilder |
			| anItemElement |
			anItemElement := aBuilder itemBlock cull: anItem.
			aBuilder bindBlock cull: anItemElement cull: anItem.
			aStream nextPut: anItemElement ] ].
	
	self removeChildren.
	self addChildren: theItemElements