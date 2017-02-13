private
moveForward

	position := position + 1.
	
	currentIterator hasNext
		ifTrue: [ ^ self ].

	self hasNext
		ifFalse: [ ^ self ].
		
	currentIterator := self forwardIteratorAt: position