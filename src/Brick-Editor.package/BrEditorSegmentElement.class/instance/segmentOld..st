accessing
segmentOld: aSegment
	| theWords itemsSize aManagedSize aSize theChildren theManagedChildren |
	
	self releaseCaches.

	self layout: aSegment layout.
	segment := aSegment.

	"amount of managed and visible children"
	aManagedSize := self managedChildren size.
	"amount of all children"
	aSize := self childrenCount.
	
	itemsSize := aSegment size.

	theWords := aSegment items.

	"unmanage and hide unneeded children"
	itemsSize < aManagedSize
		ifTrue: [
			| allChildren |
			allChildren := self children all.
			(itemsSize + 1) to: aManagedSize do: [ :anIndex |
				| anElement |
				anElement := (allChildren at: anIndex).
				anElement managed: false.
				anElement visibility: BlVisibility gone ] ].

	"create needed elements"
	theChildren := #().
	itemsSize > aSize ifTrue: [
		theChildren := (1 to: itemsSize - aSize) collect: [ :anIndex |
			BrTextEditorPieceElement new
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ];
				yourself ] ]	.
	"we don't have enough children, add new ones"
	self addChildren: theChildren.

	theManagedChildren := self children all.
	theWords withIndexDo: [ :aText :anIndex |
			(theManagedChildren at: anIndex)
				managed: true;
				visibility: BlVisibility visible;
				text: aText ]