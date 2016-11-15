picking
pickObject: aPoint
	(self containsGlobalPoint: aPoint)
		ifFalse: [ ^ nil ].
	^ self