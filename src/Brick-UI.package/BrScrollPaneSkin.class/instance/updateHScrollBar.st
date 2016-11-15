as yet unclassified
updateHScrollBar
	| contentRatio |
	contentRatio := viewport width / (viewport nodeWidth max:1).
	contentRatio > 0
		ifTrue: [ 
			hbar visibleAmount: contentRatio * (hbar max - hbar min).
			hbar blockIncrement: 0.9 * hbar visibleAmount.
			hbar unitIncrement: 0.1 * hbar visibleAmount ]
		ifFalse: [ hbar visibleAmount: 0.
			hbar blockIncrement: 0.
			hbar unitIncrement: 0 ].
	self updatePositionX