api - cursor
globalTextIndexToLocal: aTextIndex
	<return: #Number>

	^ self text isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ aTextIndex - self start + 1 ]