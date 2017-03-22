accessing
segment: aSegment
	| theElements |

	segment := aSegment.

	self layout: segment layout.

	theElements := Array streamContents: [ :aStream |
		segment itemsDo: [ :anItem :aBuilder |
			(aBuilder itemElements: anItem) asOrderedCollection do: [ :anItemElement |
				aBuilder bindItem: anItem to: anItemElement.
				aStream nextPut: anItemElement ] ] ].

	self removeChildren.
	theElements do: [ :anElement | anElement removeFromParent ].
	self addChildren: theElements