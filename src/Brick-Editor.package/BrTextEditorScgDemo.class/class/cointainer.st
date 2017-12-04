demo - model and ui
cointainer
	| container |
	container := BlElement new.
	container clipChildren: false.
	container layout: (GtGraphHorizontalTreeLayout new horizontalGap: 50).
	^ container