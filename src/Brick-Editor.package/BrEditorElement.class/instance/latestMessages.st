evaluation
latestMessages
	^ self messages select: [ :each | each date > self aDate ]