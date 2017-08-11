cache - accessing
start
	"Return the index of the first cached item in the text or 0 if nothing is cached"
	<return: #Number>

	^ self hasCached
		ifTrue: [ subText start ]
		ifFalse: [ 0 ]