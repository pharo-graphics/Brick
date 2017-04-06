action
replaceIn: anElement on: aStream
	
	anElement dispatchEvent: (BrSelectionCollectEvent new stream: aStream).
	
	anElement childrenDo: [ :aChild | self replaceIn: aChild on: aStream ]