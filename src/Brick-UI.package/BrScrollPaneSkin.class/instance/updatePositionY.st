as yet unclassified
updatePositionY
	| yAxis |
	positionY := vbar scrollValue.
	yAxis :=  viewport position y - (viewport nodeHeight - viewport height) * (positionY/(vbar max - vbar min)).
	widget vValue: (positionY min: widget vMax max: widget vMin).
	widget content relocate: widget content position x @ yAxis