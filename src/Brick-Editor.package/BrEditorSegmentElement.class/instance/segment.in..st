accessing
segment: aSegment in: anEditor
	| theElements |

	segment := aSegment.

	self layout: segment layout.

	theElements := Array streamContents: [ :aStream |
		segment itemsDo: [ :anItem :aBuilder |
			(aBuilder itemElements: anItem in: anEditor for: aSegment) asOrderedCollection do: [ :anItemElement |
				aBuilder bindItem: anItem to: anItemElement.
				anItemElement
					addEventHandlerOn: BrSelectionCollectEvent
					do: [ :anEvent |
						(anEvent currentTarget userData at: #selected ifAbsent: [ false ])
							ifTrue: [ aBuilder collectSelection: anEvent currentTarget on: anEvent stream ] ];
					addEventHandlerOn: BrSelectionEvent
					do: [ :anEvent |
						anEvent currentTarget userData at: #selected put: true.
						anEvent currentTarget effect: (BlOverlayAboveEffect new paint: ((Color blue) alpha: 0.1)) ];
					addEventHandlerOn: BrDeselectionEvent
					do: [ :anEvent |
						anEvent currentTarget userData at: #selected put: false.
						anEvent currentTarget effect: BlNullEffect new ].
				aStream nextPut: anItemElement ] ] ].

	self removeChildren.
	theElements do: [ :anElement | anElement removeFromParent ].
	self addChildren: theElements