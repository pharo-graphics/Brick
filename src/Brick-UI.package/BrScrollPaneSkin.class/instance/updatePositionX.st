as yet unclassified
updatePositionX
	| xAxis |
	positionX := hbar scrollValue.
	xAxis :=  viewport position x - (viewport nodeWidth - viewport width) * (positionX/(hbar max - hbar min)).
	widget hValue: (positionX min: widget hMax max: widget hMin).
	widget content relocate: xAxis @ widget content position y