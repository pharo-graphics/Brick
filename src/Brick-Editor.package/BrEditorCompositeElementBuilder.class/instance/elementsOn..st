as yet unclassified
elementsOn: anObject
	
	^ Array streamContents: [ :aStream |
		builders do: [ :aBuilder |
			aStream nextPutAll: (aBuilder elementsOn: anObject) asOrderedCollection ] ]