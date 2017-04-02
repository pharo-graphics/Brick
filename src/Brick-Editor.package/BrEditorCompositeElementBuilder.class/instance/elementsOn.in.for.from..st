as yet unclassified
elementsOn: anObject in: anEditor for: aSegment from: anEditorBuilder
	
	^ Array streamContents: [ :aStream |
		builders do: [ :aBuilder |
			aStream nextPutAll: (aBuilder elementsOn: anObject in: anEditor for: aSegment from: anEditorBuilder) asOrderedCollection ] ]