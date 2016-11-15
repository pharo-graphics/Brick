accessing
root
	^ self children at: 1 ifAbsent: [ nil ]