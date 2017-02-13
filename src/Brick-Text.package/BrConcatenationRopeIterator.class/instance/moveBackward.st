private
moveBackward

	position := position - 1.

	currentIterator hasPrevious
		ifTrue: [ ^ self ].
	
	self hasPrevious
		ifFalse: [ ^ self ].
	
	currentIterator := self backwardIteratorAt: position