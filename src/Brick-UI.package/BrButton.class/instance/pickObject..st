as yet unclassified
pickObject: aPoint
	(self containsGlobalPoint: aPoint)
		ifFalse: [ ^ nil ].
	^ self