as yet unclassified
layoutTrack: aTrack
	^ aTrack constraintsDo: [ :c | 
		c vertical matchParent.
		c linear vertical alignCenter.
		c linear horizontal alignRight  ]