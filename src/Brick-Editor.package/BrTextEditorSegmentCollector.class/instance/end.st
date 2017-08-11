cache - accessing
end
	"Return the index of the last cached item in the text or 0 if nothing is cached"
	<return: #Number>
	
	^ self hasCached
		ifTrue: [ subText end ]
		ifFalse: [ 0 ]