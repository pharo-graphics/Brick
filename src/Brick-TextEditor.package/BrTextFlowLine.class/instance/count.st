accessing
count
	"Return how many lines there are in total"
	<return: #Number>
	
	^ 1 + (self hasNextLine
		ifTrue: [ self nextLine count ]
		ifFalse: [ 0 ])