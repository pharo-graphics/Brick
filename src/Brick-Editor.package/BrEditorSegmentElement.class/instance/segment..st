accessing
segment: aSegment
	| theItemElements |
	
	self releaseCaches.

	segment := aSegment.

	self layout: segment layout.

	theItemElements := Array streamContents: [ :aStream |
		segment itemsDo: [ :anItem :aBuilder |
			| anItemElement |
			
			anItemElement := aBuilder itemElement: anItem.
			aBuilder bindItem: anItem to: anItemElement.
			
			aStream nextPut: anItemElement ] ].
	
	self removeChildren.
	theItemElements do: [ :anElement | anElement removeFromParent ].
	self addChildren: theItemElements