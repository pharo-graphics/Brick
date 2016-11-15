as yet unclassified
updateVScrollBar
	| contentRatio |
	contentRatio := viewport height / (viewport nodeHeight max:1).
	contentRatio > 0
		ifTrue: [ 
			vbar visibleAmount: contentRatio * (vbar max - vbar min).
			vbar blockIncrement: 0.9 * vbar visibleAmount.
			vbar unitIncrement: 0.1 * vbar visibleAmount ]
		ifFalse: [ vbar visibleAmount: 0.
			vbar blockIncrement: 0.
			vbar unitIncrement: 0 ].
		vbar height: viewport height.
	self updatePositionY