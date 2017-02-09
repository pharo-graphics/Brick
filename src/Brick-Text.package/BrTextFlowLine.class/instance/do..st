enumerating
do: aBlock
	"Evaluate aBlock with each of my next lines as the argument"

	aBlock value: self.
	self hasNextLine
		ifTrue: [ nextLine do: aBlock ]