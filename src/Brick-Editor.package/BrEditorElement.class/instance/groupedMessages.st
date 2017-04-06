evaluation
groupedMessages
	^ self latestMessages groupedBy: [ :each | each sender ]