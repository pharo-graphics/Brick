scrolling
scrollBy2: aPoint
	"Scroll receiver by some offset"
	| x y visibleExtent textExtent textOrigin dX dY delta maxDelta |
	x := aPoint x.
	y := aPoint y.
	visibleExtent := innerContainer extent.
	textExtent := textContainer extent.
	textOrigin := textContainer position.
	
	maxDelta := textExtent - visibleExtent.
	(x > visibleExtent x) 
		ifTrue:[ dX := (x - visibleExtent x) ]
		ifFalse:[dX := x].
	(y > visibleExtent y) 
		ifTrue:[ dY := (y - visibleExtent y + caret height) ]
		ifFalse:[dY := y].
	delta := (dX@dY) min: maxDelta max: 0 @ 0.
	textContainer relocate: delta negated