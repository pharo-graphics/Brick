accessing
insertedAt: anIndex itemCount: anItemCount
	pieces
		select: [ :aSubText | (anIndex between: aSubText start and: aSubText end) or: [ aSubText start >= anIndex ] ]
		thenDo: [ :aSubText |
			(anIndex between: aSubText start and: aSubText end)
				ifTrue: [ aSubText end: aSubText end + anItemCount ]
				ifFalse: [
					aSubText start: aSubText start + anItemCount.
					aSubText end: aSubText end + anItemCount ] ]