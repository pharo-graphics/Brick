accessing
segment: aSegment
	| theWords aManagedSize aSize theChildren theManagedChildren |
	
	self releaseCaches.

	self layout: aSegment layout.
	segment := aSegment.

	"amount of managed and visible children"
	aManagedSize := self managedChildren size.
	"amount of all children"
	aSize := self childrenCount.
	
	theWords := aSegment items.

	"unmanage and hide unneeded children"
	theWords size < aManagedSize
		ifTrue: [
			| allChildren |
			allChildren := self children all.
			(theWords size + 1) to: aManagedSize do: [ :anIndex |
				| anElement |
				anElement := (allChildren at: anIndex).
				anElement managed: false.
				anElement visibility: BlVisibility gone ] ].

	"create needed elements"
	theChildren := #().
	theWords size > aSize ifTrue: [
		theChildren := (1 to: theWords size - aSize) collect: [ :anIndex |
			BrEditorTextPieceElement new
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ];
				addEventHandlerOn: BrSelectionEvent do: [ :anEvent |
					anEvent currentTarget effect: (BlOverlayBelowEffect new paint: ((Color r: 0.674 g: 0.807 b: 0.969 alpha: 1.0))).
					anEvent currentTarget invalidate ];
			"BlElement new
				constraintsDo: [ :c |
					c margin: (BlInsets top: 0 right: 3 bottom: 3 left: 0) ];
				background: Color lightGray;
				size: 40@15;"
				yourself ] ]	.
	"we don't have enough children, add new ones"
	self addChildren: theChildren.

	theManagedChildren := self children all.
	theWords withIndexDo: [ :aText :anIndex |
			(theManagedChildren at: anIndex)
				managed: true;
				visibility: BlVisibility visible;
				text: aText ]